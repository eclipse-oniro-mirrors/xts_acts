/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import settings from '@ohos.settings';
import { BusinessError } from '@ohos.base';
import CommonFunc from './Common';

export default function SettingNopTest() {
  describe('SettingNopTest', () => {
    beforeEach(async (done: Function) => {
      await CommonFunc.sleep(2000);
    });
    /*
     * @tc.number:SUB_Setting_nop_test_0100
     * @tc.name: Setting_nop_test_0100
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('Setting_nop_test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
      console.info('Setting_nop_test_0100 START');
      let strJson = getInspectorByKey('settingsId1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Setting_nop_test_0100] strJson:" + JSON.stringify(obj));

      expect(obj.$attrs.content).assertEqual("201");

      done();
    })
    /*
     * @tc.number:SUB_Setting_nop_test_0200
     * @tc.name: Setting_nop_test_0200
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('Setting_nop_test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
      console.info('Setting_nop_test_0200 START');
      let strJson = getInspectorByKey('settingsId2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Setting_nop_test_0200] strJson:" + JSON.stringify(obj));

      expect(obj.$attrs.content).assertEqual("201");

      done();
    })
    /*
     * @tc.number:SUB_Setting_nop_test_0300
     * @tc.name: Setting_nop_test_0300
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('Setting_nop_test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) => {
      console.info('Setting_nop_test_0300 START');
      let strJson = getInspectorByKey('settingsId3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Setting_nop_test_0300] strJson:" + JSON.stringify(obj));

      expect(obj.$attrs.content).assertEqual("201");

      done();
    })
  })
}