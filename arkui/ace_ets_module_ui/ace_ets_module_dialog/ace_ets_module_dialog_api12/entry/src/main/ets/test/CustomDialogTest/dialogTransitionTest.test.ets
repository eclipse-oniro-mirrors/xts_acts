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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function dialogTransitionTest() {
  describe('dialogTransitionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("dialogTransitionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomDialog/dialogTransitionTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dialogTransitionTest state pages: " + JSON.stringify(pages));
        if (!("dialogTransitionTest" == pages.name)) {
          console.info("get dialogTransitionTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push dialogTransitionTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dialogTransitionTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      if(AppStorage.get('text')!= undefined){
        AppStorage.delete('text')
      }
      await CommonFunc.sleep(1000);
      console.info("dialogTransitionTest after each called");
    });

    /**
     * @tc.name   dialogTransitionTest_0100
     * @tc.number SUB_ACE_dialogTransitionTest_0100
     * @tc.desc   To test the Dialog transition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dialogTransitionTest_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('dialogTransitionTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('open'));
      await button.click();
      await CommonFunc.sleep(2000);
      let text: string = AppStorage.get('text') as string
      expect(text).assertEqual('onWillAppear');
      await driver.triggerKey(2070);
      await CommonFunc.sleep(2000);
      let text1: string = AppStorage.get('text') as string
      expect(text1).assertEqual('onDidDisappear');
      console.info('dialogTransitionTest_0100 END');
      done();
    });
  })
}