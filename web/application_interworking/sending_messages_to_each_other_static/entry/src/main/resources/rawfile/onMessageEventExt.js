/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
var h5Port;
window.addEventListener('message', function (event) {
  console.info('htmlSSSSS')
  if (event.data == 'init_web_messageport') {
    if (event.ports[0] != null) {
      h5Port = event.ports[0];
      h5Port.onmessage = function (event) {
        console.info('hwd In html got message');
        var result = event.data;
        console.info('In html got message, typeof: ', typeof (result));
        console.info('In html got message, result: ', (result));
        if (typeof (result) == 'string') {
          console.log('In html got message, String: ', result);
          document.getElementById("msg").innerHTML = 'String:' + result;
        } else if (typeof (result) == 'number') {
          console.log('In html side got message, number: ', result);
          document.getElementById("msg").innerHTML = 'Number:' + result;
        } else if (typeof (result) == 'boolean') {
          console.log('In html side got message, boolean: ', result);
          document.getElementById('msg').innerHTML = 'Boolean:' + result;
        } else if (typeof (result) == 'object') {
          if (result instanceof ArrayBuffer) {
            document.getElementById('msg2').innerHTML = 'ArrayBuffer:' + result.byteLength;
            console.log('In html got message, byteLength: ', result.byteLength);
          } else if (result instanceof Error) {
            console.log('In html error message, err:' + (result));
            console.log('In html error message, typeof err:' + typeof (result));
            document.getElementById('msg2').innerHTML = 'Error:' + result.name + ', msg:' + result.message;
          } else if (result instanceof Array) {
            console.log('In html got message, Array');
            console.log('In html got message, Array length:' + result.length);
            console.log('In html got message, Array[0]:' + (result[0]));
            console.log('In html got message, typeof Array[0]:' + typeof (result[0]));
            document.getElementById('msg2').innerHTML = 'Array len:' + result.length + ', value:' + result;
          } else {
            console.log('In html got message, not any instance of support type');
            document.getElementById('msg').innerHTML = 'not any instance of support type';
          }
        } else {
          console.log('In html got message, not support type');
          document.getElementById('msg').innerHTML = 'not support type';
        }
      }
      h5Port.onmessageerror = (event) => {
        console.error(`hwd In html Error receiving message: ${event}`);
      };
    }
  }
})

function postStringToApp() {
  if (h5Port) {
    console.log('In html send string message');
    h5Port.postMessage('hello');
    console.log('In html send string message end');
  } else {
    console.error('In html h5port is null, please init first');
  }
}

function postNumberToApp() {
  if (h5Port) {
    console.log('In html send Number message');
    h5Port.postMessage(1);
    console.log('In html send Number message end');
  } else {
    console.error('In html h5port is null, please init first');
  }
}

function postBooleanToApp() {
  if (h5Port) {
    console.log('In html send Boolean message');
    h5Port.postMessage(true);
    console.log('In html send Boolean message end');
  } else {
    console.error('In html h5port is null, please init first');
  }
}

function postBooleanFalseToApp() {
  if (h5Port) {
    console.log('In html send Boolean message');
    h5Port.postMessage(false);
    console.log('In html send Boolean message end');
  } else {
    console.error('In html h5port is null, please init first');
  }
}

function postArrayToApp() {
  if (h5Port) {
    console.log('In html send Array message');
    const fruits = [];
    fruits.push('apple');
    h5Port.postMessage(fruits);
    console.log('In html send Array message end');
  } else {
    console.error('In html h5port is null, please init first');
  }
}

function postArrayBufferToApp() {
  if (h5Port) {
    console.log('In html send Buffer message');
    let buffer = new ArrayBuffer(8);
    h5Port.postMessage(buffer);
    console.log('In html send Buffer message end');
  } else {
    console.error('In html h5port is null, please init first');
  }
}

function postErrorToApp() {
  try {
    throw new URIError('URI seq 0222')
  }
  catch (e) {
    console.log('hwd URIError:' + (e instanceof SyntaxError));
    console.log('hwd URIError:' + e.message);
    console.log('hwd URIError:' + e.name);
    if (h5Port) {
      h5Port.postMessage(e);
    }
  }
}


function postStringToHtml() {
  var a = document.getElementById('msg').innerText;
  return a;
}

function postNumberToHtml() {
  var a = document.getElementById('msg').innerText;
  return a;
}

function postBooleanToHtml() {
  var a = document.getElementById('msg').innerText;
  return a;
}

function postBooleanFalseToHtml() {
  var a = document.getElementById('msg').innerText;
  return a;
}

function postArrayToHtml() {
  var a = document.getElementById('msg2').innerText;
  return a;
}

function postArrayBufferToHtml() {
  var a = document.getElementById('msg2').innerText;
  return a;
}

function postErrorToHtml() {
  var a = document.getElementById('msg2').innerText;
  return a;
}
