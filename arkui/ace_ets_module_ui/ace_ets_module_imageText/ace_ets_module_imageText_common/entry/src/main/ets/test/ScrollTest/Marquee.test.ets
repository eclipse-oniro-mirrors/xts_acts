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
 	 import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function Marquee() {
  describe('Marquee', () => {
    beforeEach(async (done: Function) => {
      console.info('Marquee beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/Marquee',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get Marquee state success ' + JSON.stringify(pages));
        if (!pages.name.includes('Marquee')) {

          const result = await router.replaceUrl(options);
          console.info('push Marquee page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(5000); 
      } catch (err) {
        console.error('push Marquee page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('Marquee afterEach called');

    });
 	 
 	     /**
 	      * @tc.name   SUB_SCROLL_CONTENT_TEST_GET_SIZE_0100
 	      * @tc.number SUB_SCROLL_CONTENT_TEST_GET_SIZE_0100
 	      * @tc.desc   Determine if the content property is undefined
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL1
 	      */
 	     it('SUB_SCROLL_CONTENT_TEST_GET_SIZE_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_SCROLL_CONTENT_TEST_GET_SIZE_0100] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let onStopbutton = await driver.findComponent(ON.id('onStopbutton'));
      await CommonFunc.sleep(500);
      await onStopbutton.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('onStopTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_SCROLL_CONTENT_TEST_GET_SIZE_0100] component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertUndefined()
      console.info('[SUB_SCROLL_CONTENT_TEST_GET_SIZE_0100] END');
      done();
 	   })
 	  })
     }