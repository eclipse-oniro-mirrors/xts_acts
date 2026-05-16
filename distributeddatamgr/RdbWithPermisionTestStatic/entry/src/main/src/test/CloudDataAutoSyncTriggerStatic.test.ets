'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../hypium/index";
import cloudData from '@ohos.data.cloudData';

export default function CloudDataAutoSyncTrigger(): void {
  describe('CloudDataAutoSyncTrigger', () => {
    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_CLOUDDATA_AUTOSYNCTRIGGERMODE_ENUM_0100
     * @tc.name enumBoundaryTest001
     * @tc.desc 测试 AutoSyncTriggerMode 枚举 - ACCOUNT_LOGIN(0).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('enumBoundaryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(cloudData.AutoSyncTriggerMode.ACCOUNT_LOGIN).assertEqual(0);
        console.info('Test PASSED: AutoSyncTriggerMode.ACCOUNT_LOGIN = 0');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_CLOUDDATA_AUTOSYNCTRIGGERMODE_ENUM_0200
     * @tc.name enumBoundaryTest002
     * @tc.desc 测试 AutoSyncTriggerMode 枚举 - CLOUD_SWITCH_ON(1).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('enumBoundaryTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(cloudData.AutoSyncTriggerMode.CLOUD_SWITCH_ON).assertEqual(1);
        console.info('Test PASSED: AutoSyncTriggerMode.CLOUD_SWITCH_ON = 1');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_CLOUDDATA_AUTOSYNCTRIGGERMODE_ENUM_0300
     * @tc.name enumBoundaryTest003
     * @tc.desc 测试 AutoSyncTriggerMode 枚举 - NETWORK_RECOVER(2).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('enumBoundaryTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(cloudData.AutoSyncTriggerMode.NETWORK_RECOVER).assertEqual(2);
        console.info('Test PASSED: AutoSyncTriggerMode.NETWORK_RECOVER = 2');
    });
  
    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_CLOUDDATA_AUTOSYNCTRIGGERMODE_ENUM_0400
     * @tc.name enumBoundaryTest004
     * @tc.desc 测试 AutoSyncTriggerMode 枚举 - CLOUD_DATA_CHANGE(3).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('enumBoundaryTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(cloudData.AutoSyncTriggerMode.CLOUD_DATA_CHANGE).assertEqual(3);
      console.info('Test PASSED: AutoSyncTriggerMode.CLOUD_DATA_CHANGE = 3');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_CLOUDDATA_AUTOSYNCTRIGGERMODE_ENUM_0500
     * @tc.name enumBoundaryTest005
     * @tc.desc 测试 AutoSyncTriggerMode 枚举 - USER_CHANGE(4).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('enumBoundaryTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(cloudData.AutoSyncTriggerMode.USER_CHANGE).assertEqual(4);
      console.info('Test PASSED: AutoSyncTriggerMode.USER_CHANGE = 4');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_CLOUDDATA_ONAUTOSYNCTRIGGER_PARAM_0100
     * @tc.name normalParamTest001
     * @tc.desc 测试 onAutoSyncTrigger 方法 - 正常参数测试，传入回调函数.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('normalParamTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let observer = (triggerInfo: cloudData.AutoSyncTriggerInfo) => {
        console.info('AutoSyncTrigger callback triggered: mode=' + triggerInfo.mode);
      };

      try {
        cloudData.onAutoSyncTrigger(observer);
        console.info('Test PASSED: onAutoSyncTrigger executed successfully');
      } catch (error) {
        console.error('Test FAILED: ' + JSON.stringify(error));
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_CLOUDDATA_OFFAUTOSYNCTRIGGER_PARAM_0200
     * @tc.name normalParamTest002
     * @tc.desc 测试 offAutoSyncTrigger 方法 - 正常参数测试，传入注册的回调函数.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('normalParamTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let observer = (triggerInfo: cloudData.AutoSyncTriggerInfo) => {
        console.info('AutoSyncTrigger callback triggered: mode=' + triggerInfo.mode);
      };

      try {
        cloudData.onAutoSyncTrigger(observer);
        console.info('onAutoSyncTrigger executed successfully');
        
        cloudData.offAutoSyncTrigger(observer);
        console.info('Test PASSED: offAutoSyncTrigger executed successfully');
      } catch (error) {
        console.error('Test FAILED: ' + JSON.stringify(error));
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_CLOUDDATA_OFFAUTOSYNCTRIGGER_PARAM_0300
     * @tc.name noParamTest001
     * @tc.desc 测试 offAutoSyncTrigger 方法 - 无参数测试，取消所有订阅.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('noParamTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let observer1 = (triggerInfo: cloudData.AutoSyncTriggerInfo) => {
        console.info('Callback 1 triggered: mode=' + triggerInfo.mode);
      };

      let observer2 = (triggerInfo: cloudData.AutoSyncTriggerInfo) => {
        console.info('Callback 2 triggered: mode=' + triggerInfo.mode);
      };

      try {
        cloudData.onAutoSyncTrigger(observer1);
        cloudData.onAutoSyncTrigger(observer2);
        console.info('Registered 2 observers');
        
        cloudData.offAutoSyncTrigger();
        console.info('Test PASSED: offAutoSyncTrigger without parameters executed successfully');
      } catch (error) {
        console.error('Test FAILED: ' + JSON.stringify(error));
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_CLOUDDATA_ONAUTOSYNCTRIGGER_ERROR_0100
     * @tc.name errorCode801Test001
     * @tc.desc 测试 onAutoSyncTrigger 方法 - 错误码测试801，Capability not supported.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('errorCode801Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let observer = (triggerInfo: cloudData.AutoSyncTriggerInfo) => {
          console.info('AutoSyncTrigger callback triggered');
        };
  
        try {
          cloudData.onAutoSyncTrigger(observer);
          console.info('Test PASSED: Device supports cloud sync capability');
        } catch (error) {
          console.info('Error caught: ' + JSON.stringify(error));
          if (error.code == 801) {
            expect(error.code).assertEqual(801);
            console.info('Test PASSED: Capability not supported error handled correctly');
          } else {
            expect().assertFail();
          }
        }
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_CLOUDDATA_OFFAUTOSYNCTRIGGER_ERROR_0100
     * @tc.name errorCode801Test002
     * @tc.desc 测试 offAutoSyncTrigger 方法 - 错误码测试801，Capability not supported.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('errorCode801Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let observer = (triggerInfo: cloudData.AutoSyncTriggerInfo) => {
        console.info('AutoSyncTrigger callback triggered');
      };

      try {
        cloudData.offAutoSyncTrigger(observer);
        console.info('Test PASSED: Device supports cloud sync capability');
      } catch (error) {
        console.info('Error caught: ' + JSON.stringify(error));
        if (error.code == 801) {
            expect(error.code).assertEqual(801);
            console.info('Test PASSED: Capability not supported error handled correctly');
        } else {
            expect().assertFail();
        }
      }
    });
  });
}