'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function TextPickerValue() {
  describe('TextPickerValue', () => {
    beforeAll(() => {
      console.info("TextPickerValue beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.information.api20.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('TextPickerValue beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/TextPickerValue',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextPickerValue state pages:' + JSON.stringify(pages));
        if (!('TextPickerValue' === pages.name)) {
          console.info('get TextPickerValue pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push TextPickerValue page error:' + err);
      }
      console.info('TextPickerValue beforeEach end');
    });

    /**
     * @tc.number: TextPickerValue_static_001
     * @tc.name  : TextPickerValue_static_001
     * @tc.desc  : To test the value: $r('app.string.apple')
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
     */
    it('TextPickerValue_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerValue_001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextPickerValue_001 component obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('apple');
      console.info('[TextPickerValue_001] END');
      done();
    });

    /**
     * @tc.number: TextPickerValue_static_002
     * @tc.name  : TextPickerValue_static_002
     * @tc.desc  : To test the value: undefined
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
     */
    it('TextPickerValue_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerValue_002 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextPicker1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextPickerValue_002 component obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('apple');
      console.info('[TextPickerValue_002] END');
      done();
    });



    /**
     * @tc.number: TextPickerValue_static_004
     * @tc.name  : TextPickerValue_static_004
     * @tc.desc  : To test the value: apple
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
     */
    it('TextPickerValue_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerValue_004 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextPicker3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextPickerValue_004 component obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('apple');
      console.info('[TextPickerValue_004] END');
      done();
    });
  })
}
