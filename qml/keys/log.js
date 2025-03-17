.pragma library

// 读取文件内容
function readFile(filePath) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", filePath, false); // 同步读取
    xhr.send();
    if (xhr.status === 200) {
        return xhr.responseText;
    } else {
        console.error("Failed to read file:", xhr.statusText);
        return null;
    }
}

// 写入文件内容
function writeFile(filePath, content) {
    var xhr = new XMLHttpRequest();
    xhr.open("PUT", filePath, false); // 同步写入
    xhr.send(content);
    if (xhr.status !== 200) {
        console.error("Failed to write file:", xhr.statusText);
    }
}

// 追加内容到文件
function appendToFile(filePath, content) {
    var existingContent = readFile(filePath); // 读取现有内容
    if (existingContent === null) {
        existingContent = ""; // 如果文件不存在，初始化为空
    }
    var newContent = existingContent + content; // 追加内容
    writeFile(filePath, newContent); // 写入文件
}

function log(content) {
    appendToFile("file:///tmp/maliit_log.log", "\n" + new Date() + " --> " + content);
}