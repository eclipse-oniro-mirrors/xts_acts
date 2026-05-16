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

export default {
  data: {
    itemIndex: 0,
    todolist: [
      {
        id: 0,
        title: '应用上下文',
        url: 'pages/app/index'
      },
      {
        id: 1,
        title: '应用配置',
        url: 'pages/configuration/index'
      },
      {
        id: 2,
        title: '定时器(timeout)',
        url: 'pages/timer/setTimeout01/index'
      },
      {
        id: 3,
        title: '定时器(interval)',
        url: 'pages/timer/setInterval02/index'
      },
      {
        id: 4,
        title: '数据存储',
        url: 'pages/storage/storage01/index'
      },
      {
        id: 5,
        title: '文件存储',
        url: 'pages/file/index/index'
      },
      {
        id: 6,
        title: '振动',
        url: 'pages/vibrator/index'
      },
      {
        id: 7,
        title: '传感器(计步)',
        url: 'pages/sensor/stepCounter/index'
      },
      {
        id: 8,
        title: '传感器(气压)',
        url: 'pages/sensor/barometer/index'
      },
      {
        id: 9,
        title: '传感器(心率)',
        url: 'pages/sensor/heartRate/index'
      },
      {
        id: 10,
        title: '传感器(佩戴)',
        url: 'pages/sensor/onBodyState/index'
      },
      {
        id: 11,
        title: '传感器(加速度)',
        url: 'pages/sensor/accelerometer/index'
      },
      {
        id: 12,
        title: '传感器(陀螺仪)',
        url: 'pages/sensor/gyroscope/index'
      },
      {
        id: 13,
        title: '地理位置(info)',
        url: 'pages/location/info/index'
      },
      {
        id: 14,
        title: '地理位置(订阅)',
        url: 'pages/location/subscribe/index'
      },
      {
        id: 15,
        title: '设备信息',
        url: 'pages/deviceInfo/index'
      },
      {
        id: 16,
        title: '屏幕亮度(value)',
        url: 'pages/brightness/value/index'
      },
      {
        id: 17,
        title: '屏幕亮度(Mode)',
        url: 'pages/brightness/mode/index'
      },
      {
        id: 18,
        title: '电量信息',
        url: 'pages/battery/index'
      },
      {
        id: 19,
        title: 'NFC卡片',
        url: 'pages/nfc/index'
      },
      {
        id: 20,
        title: '返回首页',
        url: 'pages/index/index'
      }
    ]
  },

  onShow() {
    console.info("onShow item_index: " + this.itemIndex);
    this.$refs.list.scrollTo({index: this.itemIndex});
  },

  clickChange(item) {
    console.info('onclick url: ' + item.url);
    router.replace({
      uri: item.url,
      params: {
        itemIndex: item.id
      }
    });
  },

  swipeEvent(e) {
    if (e.direction === 'right') {
      console.info('swipeEvent');
      router.replace({ uri: 'pages/index/index' });
    }
  },
};
