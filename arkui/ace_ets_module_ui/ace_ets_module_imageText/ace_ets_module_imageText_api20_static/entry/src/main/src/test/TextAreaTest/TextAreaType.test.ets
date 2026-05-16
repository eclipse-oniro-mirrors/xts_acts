'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
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
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';


export default function TextAreaTypeTest() {
  describe('TextAreaTypeTest', () => {
    beforeAll(() => {
      console.info("TextAreaTypeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api20.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("TextAreaTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaType',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaTypeTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaType" == pages.name)) {
          console.info("get TextAreaTypeTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaTypeTest page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   TextAreaTypeTest_static_0010
     * @tc.name     TextAreaTypeTest_static_0010
     * @tc.desc     TextAreaTypeTest_static_0010
     * @tc.level   Level.LEVEL0
     */
    it('TextAreaTypeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaTypeTest_static_0010] START');
      let strJson = inspector.getInspectorByKey('TextAreaType_ONE_TIME_CODE');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaTypeTest_static_0010] TextAreaType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('TextAreaType.ONE_TIME_CODE');
      console.info('[TextAreaTypeTest_static_0010] END');
      done();
    });
    
    
    /**
     * @tc.number   TextAreaTypeTest_static_0020
     * @tc.name     TextAreaTypeTest_static_0020
     * @tc.desc     TextAreaTypeTest_static_0020
     * @tc.level   Level.LEVEL0
     */
    it('TextAreaTypeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaTypeTest_static_0020] START');
      let strJson = inspector.getInspectorByKey('TextAreaType_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaTypeTest_static_0020] TextAreaType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('TextAreaType.NORMAL');
      console.info('[TextAreaTypeTest_static_0020] END');
      done();
    });

    
    /**
     * @tc.number   TextAreaTypeTest_static_0030
     * @tc.name     TextAreaTypeTest_static_0030
     * @tc.desc     TextAreaTypeTest_static_0030
     * @tc.level   Level.LEVEL0
     */
    it('TextAreaTypeTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaTypeTest_static_0030] START');
      let strJson = inspector.getInspectorByKey('TextAreaType_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaTypeTest_static_0030] TextAreaType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('TextAreaType.NORMAL');
      console.info('[TextAreaTypeTest_static_0030] END');
      done();
    });

    
    /**
     * @tc.number   TextAreaTypeTest_static_0040
     * @tc.name     TextAreaTypeTest_static_0040
     * @tc.desc     TextAreaTypeTest_static_0040
     * @tc.level   Level.LEVEL0
     */
    it('TextAreaTypeTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaTypeTest_static_0040] START');
      let strJson = inspector.getInspectorByKey('TextAreaType_Modifier');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaTypeTest_static_0040] TextAreaType: ' + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('TextAreaType.ONE_TIME_CODE');
      console.info('[TextAreaTypeTest_static_0040] END');
      done();
    });
  })
}