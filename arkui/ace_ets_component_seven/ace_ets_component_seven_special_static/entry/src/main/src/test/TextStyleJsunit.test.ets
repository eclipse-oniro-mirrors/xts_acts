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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function textStyleJsunit() {
  describe('textStyleTest', () => {
    beforeAll(() => {
      console.info("textStyleTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textStyle state pages:" + JSON.stringify(pages));
        if (!("textStyle" == pages.name)) {
          console.info("get textStyle state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textStyle page error:" + err);
      }
    });

    
    
/**
     * @tc.number   testTextStyle001
     * @tc.name     testTextStyle001
     * @tc.desc     testTextStyle001
     * @tc.level    Level.LEVEL0
     */
it('testTextStyle001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTextStyle001] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('text1');
      console.info("[testTextStyle001] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);

      expect(obj!.getElement('$attrs').getString('fontColor')).assertEqual('#FFFF0000');
      done();
    });

    
    
/**
     * @tc.number   testTextStyle002
     * @tc.name     testTextStyle002
     * @tc.desc     testTextStyle002
     * @tc.level    Level.LEVEL0
     */
it('testTextStyle002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTextStyle002] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('text1');
      console.info("[testTextStyle002] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);

      expect(obj!.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
      done();
    });

    
    
/**
     * @tc.number   testTextStyle003
     * @tc.name     testTextStyle003
     * @tc.desc     testTextStyle003
     * @tc.level    Level.LEVEL0
     */
it('testTextStyle003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTextStyle003] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('text1');
      console.info("[testTextStyle003] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);

      expect(obj!.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      done();
    });

    
    
/**
     * @tc.number   testTextStyle004
     * @tc.name     testTextStyle004
     * @tc.desc     testTextStyle004
     * @tc.level    Level.LEVEL0
     */
it('testTextStyle004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTextStyle001] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('text1');
      console.info("[testTextStyle001] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);

      expect(obj!.getElement('$attrs').getString('fontWeight')).assertEqual('700');
      done();
    });

     
     
/**
     * @tc.number   testTextStyle005
     * @tc.name     testTextStyle005
     * @tc.desc     testTextStyle005
     * @tc.level    Level.LEVEL0
     */
it('testTextStyle005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTextStyle005] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('text1');
      console.info("[testTextStyle005] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);

      expect(obj!.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Justify');
      done();
    });

  })
}