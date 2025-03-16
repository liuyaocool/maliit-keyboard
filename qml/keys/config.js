.pragma library

var configData;

// 读取配置文件
function init() {
    configData = {};
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "file:///etc/maliit/keyboard", false);
    xhr.send();
    if (xhr.status !== 200) {
        return;
    }
    xhr = xhr.responseText.split("\n");
    var namespace, line;
    for (let i = 0; i < xhr.length; i++) {
        if (!(line = xhr[i].trim())) {
            continue;
        }
        if (line.startsWith('[') && line.endsWith(']')) {
            configData[namespace = line.substr(1, line.length-2)] = {};
            continue;
        }
        line = line.split("=");
        configData[namespace][line[0].trim()] = line[1].trim();
    }
}

// 获取配置值
function get(namespace, key, def) {
    if (!configData) {
        init();
    }
    if (configData[namespace] && configData[namespace][key]) {
        return configData[namespace][key];
    }
    return def;
}