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


export default function TextLineSpacingTest() {
  describe('TextLineSpacingTest', () => {
    beforeAll(() => {
      console.info("TextLineSpacingTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api20.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("TextLineSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextLineSpacing',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextLineSpacingTest state pages: " + JSON.stringify(pages));
        if (!("TextLineSpacing" == pages.name)) {
          console.info("get TextLineSpacingTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextLineSpacingTest page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   TextLineSpacingTest_static_0010
     * @tc.name     TextLineSpacingTest_static_0010
     * @tc.desc     TextLineSpacingTest_static_0010
     * @tc.level   Level.LEVEL2
     */
    it('TextLineSpacingTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextLineSpacingTest_static_0010] START');
      let strJson = inspector.getInspectorByKey('Text_lineSpacing_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextLineSpacingTest_static_0010] lineSpacing: ' + JSON.stringify(obj.getElement('$attrs').getString('lineSpacing')));
      console.info('[TextLineSpacingTest_static_0010] onlyBetweenLines: ' + JSON.stringify(obj.getElement('$attrs').getString('onlyBetweenLines')));
      expect(obj.getElement('$attrs').getString('lineSpacing')).assertEqual('20.00lpx');
      expect(obj.getElement('$attrs').getString('onlyBetweenLines')).assertEqual('true');
      console.info('[TextLineSpacingTest_static_0010] END');
      done();
    });

    
    /**
     * @tc.number   TextLineSpacingTest_static_0020
     * @tc.name     TextLineSpacingTest_static_0020
     * @tc.desc     TextLineSpacingTest_static_0020
     * @tc.level   Level.LEVEL2
     */
    it('TextLineSpacingTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextLineSpacingTest_static_0020] START');
      let strJson = inspector.getInspectorByKey('Text_lineSpacing_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextLineSpacingTest_static_0020] lineSpacing: ' + JSON.stringify(obj.getElement('$attrs').getString('lineSpacing')));
      console.info('[TextLineSpacingTest_static_0020] onlyBetweenLines: ' + JSON.stringify(obj.getElement('$attrs').getString('onlyBetweenLines')));
      expect(obj.getElement('$attrs').getString('lineSpacing')).assertEqual('50.00%');
      expect(obj.getElement('$attrs').getString('onlyBetweenLines')).assertEqual('false');
      console.info('[TextLineSpacingTest_static_0020] END');
      done();
    });

    
    /**
     * @tc.number   TextLineSpacingTest_static_0030
     * @tc.name     TextLineSpacingTest_static_0030
     * @tc.desc     TextLineSpacingTest_static_0030
     * @tc.level   Level.LEVEL2
     */
    it('TextLineSpacingTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextLineSpacingTest_static_0030] START');
      let strJson = inspector.getInspectorByKey('Text_lineSpacing_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextLineSpacingTest_static_0030] lineSpacing: ' + JSON.stringify(obj.getElement('$attrs').getString('lineSpacing')));
      console.info('[TextLineSpacingTest_static_0030] onlyBetweenLines: ' + JSON.stringify(obj.getElement('$attrs').getString('onlyBetweenLines')));
      expect(obj.getElement('$attrs').getString('lineSpacing')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('onlyBetweenLines')).assertEqual('false');
      console.info('[TextLineSpacingTest_static_0030] END');
      done();
    });

    
    /**
     * @tc.number   TextLineSpacingTest_static_0040
     * @tc.name     TextLineSpacingTest_static_0040
     * @tc.desc     TextLineSpacingTest_static_0040
     * @tc.level   Level.LEVEL2
     */
    it('TextLineSpacingTest_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextLineSpacingTest_static_0040] START');
      let strJson = inspector.getInspectorByKey('Text_lineSpacing_undefined_all');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextLineSpacingTest_static_0040] lineSpacing: ' + JSON.stringify(obj.getElement('$attrs').getString('lineSpacing')));
      console.info('[TextLineSpacingTest_static_0040] onlyBetweenLines: ' + JSON.stringify(obj.getElement('$attrs').getString('onlyBetweenLines')));
      expect(obj.getElement('$attrs').getString('lineSpacing')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getString('onlyBetweenLines')).assertEqual('false');
      console.info('[TextLineSpacingTest_static_0040] END');
      done();
    });

    
    /**
     * @tc.number   TextLineSpacingTest_static_0050
     * @tc.name     TextLineSpacingTest_static_0050
     * @tc.desc     TextLineSpacingTest_static_0050
     * @tc.level   Level.LEVEL2
     */
    it('TextLineSpacingTest_static_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextLineSpacingTest_static_0050] START');
      let strJson = inspector.getInspectorByKey('TextModifier_lineSpacing_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextLineSpacingTest_static_0050] lineSpacing: ' + JSON.stringify(obj.getElement('$attrs').getString('lineSpacing')));
      console.info('[TextLineSpacingTest_static_0050] onlyBetweenLines: ' + JSON.stringify(obj.getElement('$attrs').getString('onlyBetweenLines')));
      expect(obj.getElement('$attrs').getString('lineSpacing')).assertEqual('20.00px');
      expect(obj.getElement('$attrs').getString('onlyBetweenLines')).assertEqual('true');
      console.info('[TextLineSpacingTest_static_0050] END');
      done();
    });

    
    /**
     * @tc.number   TextLineSpacingTest_static_0060
     * @tc.name     TextLineSpacingTest_static_0060
     * @tc.desc     TextLineSpacingTest_static_0060
     * @tc.level   Level.LEVEL2
     */
    it('TextLineSpacingTest_static_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextLineSpacingTest_static_0060] START');
      let strJson = inspector.getInspectorByKey('TextModifier_lineSpacing_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextLineSpacingTest_static_0060] lineSpacing: ' + JSON.stringify(obj.getElement('$attrs').getString('lineSpacing')));
      console.info('[TextLineSpacingTest_static_0060] onlyBetweenLines: ' + JSON.stringify(obj.getElement('$attrs').getString('onlyBetweenLines')));
      expect(obj.getElement('$attrs').getString('lineSpacing')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getString('onlyBetweenLines')).assertEqual('false');
      console.info('[TextLineSpacingTest_static_0060] END');
      done();
    });

    
    /**
     * @tc.number   TextLineSpacingTest_static_0070
     * @tc.name     TextLineSpacingTest_static_0070
     * @tc.desc     TextLineSpacingTest_static_0070
     * @tc.level   Level.LEVEL2
     */
    it('TextLineSpacingTest_static_0070', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextLineSpacingTest_static_0070] START');
      let strJson = inspector.getInspectorByKey('TextModifier_lineSpacing_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextLineSpacingTest_static_0070] lineSpacing: ' + JSON.stringify(obj.getElement('$attrs').getString('lineSpacing')));
      console.info('[TextLineSpacingTest_static_0070] onlyBetweenLines: ' + JSON.stringify(obj.getElement('$attrs').getString('onlyBetweenLines')));
      expect(obj.getElement('$attrs').getString('lineSpacing')).assertEqual('20.00fp');
      expect(obj.getElement('$attrs').getString('onlyBetweenLines')).assertEqual('false');
      console.info('[TextLineSpacingTest_static_0070] END');
      done();
    });

    
    /**
     * @tc.number   TextLineSpacingTest_static_0080
     * @tc.name     TextLineSpacingTest_static_0080
     * @tc.desc     TextLineSpacingTest_static_0080
     * @tc.level   Level.LEVEL2
     */
    it('TextLineSpacingTest_static_0080', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextLineSpacingTest_static_0080] START');
      let strJson = inspector.getInspectorByKey('TextModifier_lineSpacing_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextLineSpacingTest_static_0080] lineSpacing: ' + JSON.stringify(obj.getElement('$attrs').getString('lineSpacing')));
      console.info('[TextLineSpacingTest_static_0080] onlyBetweenLines: ' + JSON.stringify(obj.getElement('$attrs').getString('onlyBetweenLines')));
      expect(obj.getElement('$attrs').getString('lineSpacing')).assertEqual('20.00fp');
      expect(obj.getElement('$attrs').getString('onlyBetweenLines')).assertEqual('false');
      console.info('[TextLineSpacingTest_static_0080] END');
      done();
    });

    
    /**
     * @tc.number   TextLineSpacingTest_static_0090
     * @tc.name     TextLineSpacingTest_static_0090
     * @tc.desc     TextLineSpacingTest_static_0090
     * @tc.level   Level.LEVEL2
     */
    it('TextLineSpacingTest_static_0090', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextLineSpacingTest_static_0090] START');
      let strJson = inspector.getInspectorByKey('Text_lineSpacing_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextLineSpacingTest_static_0090] lineSpacing: ' + JSON.stringify(obj.getElement('$attrs').getString('lineSpacing')));
      console.info('[TextLineSpacingTest_static_0090] onlyBetweenLines: ' + JSON.stringify(obj.getElement('$attrs').getString('onlyBetweenLines')));
      expect(obj.getElement('$attrs').getString('lineSpacing')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getString('onlyBetweenLines')).assertEqual('false');
      console.info('[TextLineSpacingTest_static_0090] END');
      done();
    });
  })
}