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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from "@ohos.UiTest"
import window from '@ohos.window';
import ohosWindow from '@ohos.window';
import common from '@ohos.app.ability.common';
import settings from '@ohos.settings';
import deviceInfo from '@ohos.deviceInfo';
export default function extensionWindowPropertiesTest() {
  describe('extensionWindowProperties_test', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    let isPCStatus:string = '';
    let isAutoWindow:string = '';
    
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_WINDOW_JS_API_0100
     * @tc.name      : testUIExtensionHostWindowProxyRect
     * @tc.desc      : Obtain the area that the window rect 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testUIExtensionHostWindowProxyRect', 0, async (done: Function) => {
      let caseName = 'testUIExtensionHostWindowProxyRectTest';
      console.log(caseName + 'start run');
      let windowClass = windowStage.getMainWindowSync();
      windowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentPage');
      await sleep(2000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('button'));
      console.log(caseName + ' btn1 : ' + btn);

      if (btn == undefined) {
        console.log(caseName + 'device not support')
        done()
      } else {
        await btn.click();
        await sleep(1000);
        let btn2 = await driver.findComponent(ON.id('HelloWorld'));
        
        let txt = await btn2.getText();
        console.log(caseName + ' btn2 : ' + txt);
        expect(txt == 'true').assertTrue();
        done()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_UIEXTENSION_WINDOW_JS_API_0200
     * @tc.name      : testUIExtensionHostRectChange
     * @tc.desc      : Listen the change of rect
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testUIExtensionHostRectChange', 0, async (done: Function) => {
      let caseName = 'testUIExtensionHostRectChange';
      console.log(caseName + 'start run');
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        await windowStage.createSubWindowWithOptions('subWindowRectChange', options).then(async (subWindowClass) => {
          subWindowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentRectPage')
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          subWindowClass.showWindow()

          console.log(caseName + 'after createSubWindow')

          await sleep(1000)
          let driver = Driver.create()
          let btn = await driver.findComponent(ON.id('button'))

          if (btn == undefined) {
            console.log(caseName + 'device not support')
          } else {
            await btn.click()
            await sleep(1000)

            await subWindowClass.resizeAsync(1200, 800)
            await subWindowClass.moveWindowToAsync(0, 0)

            let hw = await driver.findComponent(ON.id('testNum'))
            let testNum = await hw.getText()
            console.log(caseName + 'testNum : ' + testNum)
            expect(testNum == '2').assertTrue()
          }
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.log(caseName + 'Failed ' + JSON.stringify(exception))
        expect().assertFail()
      }
      done()
    })
    
  })
}

