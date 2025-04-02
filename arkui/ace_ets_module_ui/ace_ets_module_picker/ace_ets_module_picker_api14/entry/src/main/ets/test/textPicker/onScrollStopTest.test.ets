/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function onScrollStopTest(){
  describe('onScrollStopTest',  () =>{
    beforeEach(async (done:Function) =>{
      console.info('onScrollStopTest beforeEach start');
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/onScrollStopTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get onScrollStopTest state pages: ' + JSON.stringify(pages));
        if (!('onScrollStopTest' == pages.name)) {
          console.info('get onScrollStopTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push onScrollStopTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push onScrollStopTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: onScrollStopTest_0100
    * @tc.name  : onScrollStopTest_0100
    * @tc.desc  : To test the onScollStop interface
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('onScrollStopTest_0100', 0, async (done:Function) =>{
      console.info('onScrollStopTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('myTextPicker'));
      let rect = await btn1.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.swipe(Math.round((rect.left+rect.right)/2),Math.round((rect.top+rect.bottom)/2),Math.round((rect.left+rect.right)/2),Math.round((rect.top+rect.bottom)/4),600);
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('text');
      console.info('[onScrollStopTest_0100] onScrollStopTest JSON.parse(strJson) is: ' + JSON.stringify(strJson));
      console.info('[onScrollStopTest_0100] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[onScrollStopTest_0100] title: ' + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('stop');
      await CommonFunc.sleep(1000);
      console.info('[onScrollStopTest_0100] END');
      done();
    });

    /* *
    * @tc.number: onScrollStopTest_0200
    * @tc.name  : onScrollStopTest_0200
    * @tc.desc  : To test the onScollStop interface
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('onScrollStopTest_0200', 0, async (done:Function) =>{
      console.info('onScrollStopTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('myTextPicker1'));
      await btn1.click()
      let btn2 = await driver.findComponent(ON.text('确定'));
      await btn2.click()
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('text1');
      console.info('[onScrollStopTest_0200] onScrollStopTest JSON.parse(strJson) is: ' + JSON.stringify(strJson));
      console.info('[onScrollStopTest_0200] component JSON.parse(strJson) is: ' + JSON.stringify(JSON.parse(strJson)));
      console.info('[onScrollStopTest_0200] title: ' + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('stop');
      await CommonFunc.sleep(1000);
      console.info('[onScrollStopTest_0200] END');
      done();
    });
  })
}

