/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { saveTxtData } from '../../../common/js/saveData';
import router from '@system.router';
import file from '@system.file';

export default {
    data: {
        str: '',
        title: 'file',
        pass: 'true ;',
        fail: 'false;',

        todolist:[{
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        }
        ],
    },

    checkFile() {
        console.info('checkFile');
        this.fileWrite();
    },

    fileWrite() {
        let obj = this;
        file.writeText({
            uri: 'internal://app/testfile1',
            text: 'data info' + obj.index,
            success: function(data) {
                obj.todolist[0].title = 'writeText success. ' + 'data info ' + obj.index;
                console.log('write call success');
                obj.index++;
                obj.fileRead();
            },
            fail: function(data, code) {
                obj.todolist[0].title = 'writeText fail';
                obj.fileRead();
                console.log('write call fail');
            },
            complete: function() {
                console.log('write call complete');
            }
        });
    },

    fileRead() {
        let obj = this;
        file.readText({
            uri: 'internal://app/testfile1',
            success: function(data) {
                console.log('read call success');
                obj.todolist[1].title = 'readText success. ' + 'data info ' + data.text;
                obj.fileWriteArray();
            },
            fail: function(data, code) {
                console.log('read call fail');
                obj.todolist[1].title = 'readText fail. ';
                obj.fileWriteArray();
            },
            complete: function() {
                console.log('read call complete');
            }
        });
    },

    fileWriteArray() {
        let obj = this;
        file.writeArrayBuffer({
            uri: 'internal://app/testfile3',
            buffer: new Uint8Array(8),
            success: function(data) {
                console.log('write call success');
                obj.todolist[2].title = 'writeArrayBuffer success. ';
                obj.fileReadArray();
            },
            fail: function(data, code) {
                console.log('write call fail');
                obj.todolist[2].title = 'writeArrayBuffer fail.';
                obj.fileReadArray();
            },
            complete: function() {
                console.log('write call complete');
            }
        });
    },

    fileReadArray() {
        let obj = this;
        file.readArrayBuffer({
            uri: 'internal://app/testfile3',
            success: function(data) {
                console.log('read call success' + data.buffer);
                obj.todolist[3].title = 'readArrayBuffer success. ';
                obj.fileMkdir();
            },
            fail: function(data, code) {
                console.log('read call fail');
                obj.todolist[3].title = 'readArrayBuffer fail. ';
                obj.fileMkdir();
            },
            complete: function() {
                console.log('read call complete');
            }
        });
    },

    fileMkdir() {
        let obj = this;
        file.mkdir({
            uri: 'internal://app/testDirectory',
            success: function(data) {
                console.log('mkdir call success');
                obj.todolist[4].title = 'mkdir success. ';
                obj.fileRmdir();
            },
            fail: function(data, code) {
                console.log('mkdir call fail');
                obj.todolist[4].title = 'mkdir fail. ';
                obj.fileRmdir();
            },
            complete: function() {
                console.log('mkdir call complete');
            }
        });
    },

    fileRmdir() {
        let obj = this;
        file.rmdir({
            uri: 'internal://app/testDirectory',
            recursive: true,
            success: function(data) {
                console.log('rmdir call success');
                obj.todolist[5].title = 'rmdir success. ';
                obj.fileList();
            },
            fail: function(data, code) {
                console.log('rmdir call fail');
                obj.todolist[5].title = 'rmdir fail. ';
                obj.fileList();
            },
            complete: function() {
                console.log('rmdir call complete');
            }
        });
    },

    fileList() {
        let obj = this;
        file.list({
            uri: 'internal://app',
            success: function(data) {
                console.log('list call success ' + JSON.stringify(data.fileList));
                obj.todolist[6].title = 'list success. ';
                obj.fileGet();
            },
            fail: function(data, code) {
                console.log('list call fail');
                obj.todolist[6].title = 'list fail. ';
                obj.fileGet();
            },
            complete: function() {
                console.log('list call complete');
            }
        });
    },

    fileGet() {
        let obj = this;
        file.get({
            uri: 'internal://app/testfile1',
            success: function(data) {
                console.log('get call success ' + JSON.stringify(data));
                obj.content = JSON.stringify(data);
                obj.todolist[7].title = 'get success. ';
                obj.fileMove();
            },
            fail: function(data, code) {
                console.log('get call fail');
                obj.todolist[7].title = 'get fail. ';
                obj.fileMove();
            },
            complete: function() {
                console.log('get call complete');
            }
        });
    },

    fileMove() {
        let obj = this;
        file.move({
            srcUri: 'internal://app/testfile1',
            dstUri: 'internal://app/testfile2',
            success: function(uri) {
                console.log('move call success :' + uri);
                obj.todolist[8].title = 'move success. ';
                obj.fileCopy();
            },
            fail: function(data, code) {
                console.log('move call fail');
                obj.todolist[8].title = 'move fail. ';
                obj.fileCopy();
            },
            complete: function() {
                console.log('move call complete');
            }
        });
    },

    fileCopy() {
        let obj = this;
        file.copy({
            srcUri: 'internal://app/testfile2',
            dstUri: 'internal://app/testfile4',
            success: function(uri) {
                console.log('copy call success :' + uri);
                obj.todolist[9].title = 'copy success. ';
                obj.fileDel();
            },
            fail: function(data, code) {
                console.log('copy call fail');
                obj.todolist[9].title = 'copy fail. ';
                obj.fileDel();
            },
            complete: function() {
                console.log('copy call complete');
            }
        });
    },

    fileDel() {
        let obj = this;
        file.delete({
            uri: 'internal://app/testfile2',
            success: function(data) {
                console.log('del call success');
                obj.todolist[10].title = 'delete success. ';
                obj.fileAccess();
            },
            fail: function(data, code) {
                console.log('del call fail');
                obj.todolist[10].title = 'delete fail. ';
                obj.fileAccess();
            },
            complete: function() {
                console.log('del call complete');
            }
        });
    },

    fileAccess() {
        let obj = this;
        file.access({
            uri: 'internal://app/testfile4',
            success: function(data) {
                console.log('del src file exist.');
                obj.todolist[11].title = 'access success. ';
            },
            fail: function(data, code) {
                console.log('del src file not exist.');
                obj.todolist[11].title = 'access fail. ';
            },
            complete: function() {
                console.log('del src access call complete.');
            }
        });
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击测试file按钮',
                result: '预期结果：屏幕上依次呈现各接口的测试结果',
                url: 'pages/file/index/index'
            }
        });
    },

    back() {
        console.info('onclick back ');
        router.replace({ uri: 'pages/second-api/index' });
    },

    changeResult(result) {
        saveTxtData(this, result);
    },
};