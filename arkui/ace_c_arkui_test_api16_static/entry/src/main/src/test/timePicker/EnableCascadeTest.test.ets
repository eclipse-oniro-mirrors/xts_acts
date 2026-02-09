'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, Level , beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function TimePickerTest() {

  describe('TimePickerTest',() => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api16.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   EnableCascadeTest001
     * @tc.name     EnableCascadeTest001
     * @tc.desc     EnableCascadeTest001
     * @tc.level    Level.LEVEL1
     */
    it('EnableCascadeTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnableCascadeTest001 START');
      let PAGE_TAG = 'EnableCascadeTest';
      await Utils.pushPage(`timePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('timePicker_001');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[EnableCascadeTest001]markToday:" + JSON.stringify(obj.getElement('$attrs').getBoolean('enableCascade')));
      await Utils.sleep(1000)
      expect(obj.getElement('$attrs').getBoolean('enableCascade')).assertEqual(true);
      await Utils.sleep(1000)
      console.info('EnableCascadeTest001 END');
      done();
    })

    
    /**
     * @tc.number   EnableCascadeTest002
     * @tc.name     EnableCascadeTest002
     * @tc.desc     EnableCascadeTest002
     * @tc.level    Level.LEVEL1
     */
    it('EnableCascadeTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnableCascadeTest001 START');
      let PAGE_TAG = 'EnableCascadeTest';
      await Utils.pushPage(`timePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('timePicker_002');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[EnableCascadeTest002]markToday:" + JSON.stringify(obj.getElement('$attrs').getBoolean('enableCascade')));
      await Utils.sleep(1000)
      expect(obj.getElement('$attrs').getBoolean('enableCascade')).assertEqual(false);
      await Utils.sleep(1000)
      console.info('EnableCascadeTest002 END');
      done();
    })

    
    /**
     * @tc.number   EnableCascadeTest003
     * @tc.name     EnableCascadeTest003
     * @tc.desc     EnableCascadeTest003
     * @tc.level    Level.LEVEL1
     */
    it('EnableCascadeTest003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('EnableCascadeTest003 START');
      let PAGE_TAG = 'EnableCascadeTest';
      await Utils.pushPage(`timePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = inspector.getInspectorByKey('timePicker_003');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[EnableCascadeTest003]markToday:" + JSON.stringify(obj.getElement('$attrs').getBoolean('enableCascade')));
      await Utils.sleep(1000)
      expect(obj.getElement('$attrs').getBoolean('enableCascade')).assertEqual(false);
      await Utils.sleep(1000)
      console.info('EnableCascadeTest003 END');
      done();
    })
  })
}