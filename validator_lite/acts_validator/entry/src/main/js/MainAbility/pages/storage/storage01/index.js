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

import router from '@system.router';
import storage from '@system.storage';

export default {
  data: {
    itemIndex: -1,
    str: '',
    title: 'storage',
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
    }
    ],
  },
  checkStorage() {
    this.storageSet();
  },

  storageSet() {
    let obj = this;
    storage.set({
      key: 'Storage1',
      value: 'Info1',
      success: function() {
        console.log('storageSet call success, key = Storage1, value = Info1');
        obj.todolist[0].title = 'set success. ';
        obj.storageGet();
      },
      fail: function(data, code) {
        console.log('storageSet call fail, key = Storage1, value = Info1');
        obj.todolist[0].title = 'set fail. ';
        obj.storageGet();
      },
      complete: function() {
        console.log('storageSet call complete');
      }
    });
  },

  storageGet() {
    let obj = this;
    storage.get({
      key: 'Storage1',
      success: function(data) {
        console.log('storageGet call success, key = Storage1, expected value = Info1');
        obj.todolist[1].title = 'get success. ';
        obj.storageDelete();
      },
      fail: function(data, code) {
        console.log('storageGet call fail, key = Storage1');
        obj.todolist[1].title = 'get fail. ';
        obj.storageDelete();
      },
      complete: function() {
        console.log('storageGet call complete');
      }
    });
  },
  storageDelete() {
    let obj = this;
    storage.delete({
      key: 'Storage1',
      success: function(data) {
        console.log('storageDelete call success, key = Storage1');
        obj.todolist[2].title = 'delete success. ';
        obj.storageSet2();
      },
      fail: function(data, code) {
        console.log('storageDelete call fail, key = Storage1');
        obj.todolist[2].title = 'delete fail. ';
        obj.storageSet2();
      },
      complete: function() {
        console.log('storageDelete call complete');
      }
    });
  },

  storageSet2() {
    let obj = this;
    storage.set({
      key: 'Storage2',
      value: 'Info2',
      success: function() {
        console.log('storageSet call success, key = Storage1, value = Info1');
        obj.storageClear();
      },
      fail: function(data, code) {
        console.log('storageSet call fail, key = Storage1, value = Info1');
        obj.storageClear();
      },
      complete: function() {
        console.log('storageSet call complete');
      }
    });
  },

  storageClear() {
    let obj = this;
    storage.clear({
      success: function(data) {
        console.log('storageClear call success');
        obj.todolist[3].title = 'clear success. ';
      },
      fail: function(data, code) {
        console.log('storageClear call fail');
        obj.todolist[3].title = 'clear fail. ';
      },
      complete: function() {
        console.log('storageClear call complete');
      }
    });
  },

  onDestroy() {
      this.storageClear();
  },

  help() {
    router.replace({
      uri: 'pages/help/index',
      params: {
        step: '操作步骤：点击测试storage按钮',
        result: '预期结果：屏幕上显示各接口的测试结果',
        url: 'pages/storage/storage01/index',
        itemIndex: this.itemIndex
      }
    });
  },

  back() {
    console.info('onclick back ');
    router.replace({
      uri: 'pages/second-api/index',
      params: {
        itemIndex: this.itemIndex
      }
    });
  },

  changeResult(result) {
    getApp().data.keyList[this.title] = result;
    this.back();
  },
};
