'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
export default function LengthUnitTest() {
  describe('LengthUnitTest', () => { 
    beforeAll(() => {
      console.info("LengthUnitTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () : Promise<void> => {
      console.info("LengthUnitTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Graphics/LengthUnit",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get LengthUnitTest state pages: " + JSON.stringify(pages));
        if (!("LengthUnit" == pages.name)) {
          console.info("get LengthUnitTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push LengthUnitTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LengthUnitTest page error: " + err);
           expect().assertFail();
      }
      //done();
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LengthUnitTest after each called");
    });
    
    



    /**
     * @tc.number   LengthUnitTest_static_001
     * @tc.name     LengthUnitTest_static_001
     * @tc.desc     LengthUnitTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('LengthUnitTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[LengthUnitTest_001] START');
      await CommonFunc.sleep(1000);
      let span_px = inspector.getInspectorByKey('span_px');
      console.info('span_px log-----' + JSON.parseJsonElement(span_px).getElement('$attrs').getString('baselineOffset'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(span_px).getElement('$attrs').getString('baselineOffset')).assertEqual('20.00px');
      console.info('[LengthUnitTest_001] END');
      done();
    });
    
    



    /**
     * @tc.number   LengthUnitTest_static_002
     * @tc.name     LengthUnitTest_static_002
     * @tc.desc     LengthUnitTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('LengthUnitTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[LengthUnitTest_002] START');
      await CommonFunc.sleep(1000);
      let span_fp = inspector.getInspectorByKey('span_fp');
      console.info('span_fp log-----' + JSON.parseJsonElement(span_fp).getElement('$attrs').getString('baselineOffset'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(span_fp).getElement('$attrs').getString('baselineOffset')).assertEqual('20.00fp');
      console.info('[LengthUnitTest_002] END');
      done();
    });
    
    



    /**
     * @tc.number   LengthUnitTest_static_003
     * @tc.name     LengthUnitTest_static_003
     * @tc.desc     LengthUnitTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('LengthUnitTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[LengthUnitTest_003] START');
      await CommonFunc.sleep(1000);
      let span_percent = inspector.getInspectorByKey('span_percent');
      console.info('span_percent log-----' + JSON.parseJsonElement(span_percent).getElement('$attrs').getString('baselineOffset'));
      console.info('span_percent attrs-----' + JSON.parseJsonElement(span_percent).getElement('$attrs'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(span_percent).getElement('$attrs').getString('baselineOffset')).assertEqual('0.00px');
      console.info('[LengthUnitTest_003] END');
      done();
    });
    
    



    /**
     * @tc.number   LengthUnitTest_static_004
     * @tc.name     LengthUnitTest_static_004
     * @tc.desc     LengthUnitTest_static_004
     * @tc.level    Level.LEVEL0
     */
it('LengthUnitTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[LengthUnitTest_004] START');
      await CommonFunc.sleep(1000);
      let span_lpx = inspector.getInspectorByKey('span_lpx');
      console.info('span_lpx log-----' + JSON.parseJsonElement(span_lpx).getElement('$attrs').getString('baselineOffset'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(span_lpx).getElement('$attrs').getString('baselineOffset')).assertEqual('20.00lpx');
      console.info('[LengthUnitTest_004] END');
      done();
    });
  })
}