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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'

interface optionsObj {
  uri: string
}
export default function TextPicker() {
    describe('TextPicker', () => {
      beforeAll(() => {
        console.info("TextPicker beforeEach start");
        await UtilsTest.msSleep(4000)
        await UtilsTest.startAbility("com.arkui.ace.picker.api16.static", "EntryAbility")
        await UtilsTest.msSleep(4000)
      });

      beforeEach(async (): Promise<void> => {
        console.info("TextPicker beforeEach start");
        let options: router.RouterOptions = {
          url:'MainAbility/pages/crownSensitivity/TextPicker',
        }
        try {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.clear();
          let pages:router.RouterState = routerInstance.getState();
          console.info("get TextPicker state pages:" + JSON.stringify(pages));
          if (!("TextPicker" == pages.name)) {
            console.info("get TextPicker pages.name:" + '');
            
            
            routerInstance.pushUrl(options);
            await CommonFunc.sleep(2000);
            
          }
        } catch (err) {
          console.error("push TextPicker page error:" + err);
        }
        console.info("TextPicker beforeEach end");
      }); 


        afterEach(async () => {
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });

        
        


/**
     * @tc.number   ArkUX_Stage_TextPicker_ComponentTest_static_0100
     * @tc.name     ArkUX_Stage_TextPicker_ComponentTest_static_0100
     * @tc.desc     ArkUX_Stage_TextPicker_ComponentTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_ComponentTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0100] START');
          let strJson = inspector.getInspectorByKey('textpicker01');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0100] attr: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0100] digitalCrownSensitivity: " + JSON.stringify(obj.getElement('$attrs').getString('digitalCrownSensitivity')));
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0100] focusOnTouch: " + JSON.stringify(obj.getElement('$attrs').getBoolean('focusOnTouch')));
          expect(obj.getElement('$attrs').getString('digitalCrownSensitivity')).assertEqual('2');
          console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0100] END');
          done();
        });


        
        


/**
     * @tc.number   ArkUX_Stage_TextPicker_ComponentTest_static_0200
     * @tc.name     ArkUX_Stage_TextPicker_ComponentTest_static_0200
     * @tc.desc     ArkUX_Stage_TextPicker_ComponentTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_ComponentTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {

          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0200] START');
          let strJson = inspector.getInspectorByKey('textpicker02');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0200] attr: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0200] digitalCrownSensitivity: " + JSON.stringify(obj.getElement('$attrs').getString('digitalCrownSensitivity')));
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0200] focusable: " + JSON.stringify(obj.getElement('$attrs').getBoolean('focusable')));
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0200] focusOnTouch: " + JSON.stringify(obj.getElement('$attrs').getBoolean('focusOnTouch')));

          expect(obj.getElement('$attrs').getString('digitalCrownSensitivity')).assertEqual('0');
          console.info('[ArkUX_Stage_Picker_ComponentTest_0200] END');
          done();
        });

        
        


/**
     * @tc.number   ArkUX_Stage_TextPicker_ComponentTest_static_0300
     * @tc.name     ArkUX_Stage_TextPicker_ComponentTest_static_0300
     * @tc.desc     ArkUX_Stage_TextPicker_ComponentTest_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_ComponentTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {

          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0300] START');
          let strJson = inspector.getInspectorByKey('textpicker03');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0300] attr: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0300] digitalCrownSensitivity: " + JSON.stringify(obj.getElement('$attrs').getString('digitalCrownSensitivity')));
          expect(obj.getElement('$attrs').getString('digitalCrownSensitivity')).assertEqual('1');
          console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0300] END');
          done();
        });

        
        


/**
     * @tc.number   ArkUX_Stage_TextPicker_ComponentTest_static_0400
     * @tc.name     ArkUX_Stage_TextPicker_ComponentTest_static_0400
     * @tc.desc     ArkUX_Stage_TextPicker_ComponentTest_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_ComponentTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {

          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0400] START');
          let strJson = inspector.getInspectorByKey('textpicker04');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0400] attr: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0400] digitalCrownSensitivity: " + JSON.stringify(obj.getElement('$attrs').getString('digitalCrownSensitivity')));
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0400] defaultFocus: " + JSON.stringify(obj.getElement('$attrs').getBoolean('defaultFocus')));
          expect(obj.getElement('$attrs').getString('digitalCrownSensitivity')).assertEqual('1');
          console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0400] END');
          done();
        });

        
        


/**
     * @tc.number   ArkUX_Stage_TextPicker_ComponentTest_static_0500
     * @tc.name     ArkUX_Stage_TextPicker_ComponentTest_static_0500
     * @tc.desc     ArkUX_Stage_TextPicker_ComponentTest_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_ComponentTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {

          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0500] START');
          let strJson = inspector.getInspectorByKey('textpicker05');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0500] attr: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0500] digitalCrownSensitivity: " + JSON.stringify(obj.getElement('$attrs').getString('digitalCrownSensitivity')));
          expect(obj.getElement('$attrs').getString('digitalCrownSensitivity')).assertEqual('1');
          console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0500] END');
          done();
        });

      
      


/**
     * @tc.number   ArkUX_Stage_TextPicker_ComponentTest_static_0600
     * @tc.name     ArkUX_Stage_TextPicker_ComponentTest_static_0600
     * @tc.desc     ArkUX_Stage_TextPicker_ComponentTest_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_ComponentTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {

        // Verify the functions of the ArcAlphabetIndexer component
        console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0600] START');
        let strJson = inspector.getInspectorByKey('textpicker06');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0600] attr: " + JSON.stringify(obj.getElement('$attrs')));
        console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0600] digitalCrownSensitivity: " + JSON.stringify(obj.getElement('$attrs').getString('digitalCrownSensitivity')));
        expect(obj.getElement('$attrs').getString('digitalCrownSensitivity')).assertEqual('1');
        console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0600] END');
        done();
      });

      
      


/**
     * @tc.number   ArkUX_Stage_TextPicker_ComponentTest_static_0700
     * @tc.name     ArkUX_Stage_TextPicker_ComponentTest_static_0700
     * @tc.desc     ArkUX_Stage_TextPicker_ComponentTest_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_ComponentTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {

        // Verify the functions of the ArcAlphabetIndexer component
        console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0700] START');
        let strJson = inspector.getInspectorByKey('textpicker07');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0700] attr: " + JSON.stringify(obj.getElement('$attrs')));
        console.info("[ArkUX_Stage_TextPicker_ComponentTest_static_0700] digitalCrownSensitivity: " + JSON.stringify(obj.getElement('$attrs').getString('digitalCrownSensitivity')));
        expect(obj.getElement('$attrs').getString('digitalCrownSensitivity')).assertEqual('1');
        console.info('[ArkUX_Stage_TextPicker_ComponentTest_static_0700] END');
        done();
      });
    })
}
