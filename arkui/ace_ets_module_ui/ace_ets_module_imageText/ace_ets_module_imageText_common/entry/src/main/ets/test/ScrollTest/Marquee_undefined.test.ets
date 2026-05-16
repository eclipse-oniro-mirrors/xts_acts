/**
 	  * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function MarqueeUndefined() {
  describe('MarqueeUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info('MarqueeUndefined beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/Marquee_undefined',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get MarqueeUndefined state success ' + JSON.stringify(pages));
        if (!pages.name.includes('MarqueeUndefined')) {

          const result = await router.replaceUrl(options);
          console.info('push MarqueeUndefined page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(5000); 
      } catch (err) {
        console.error('push MarqueeUndefined page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('MarqueeUndefined afterEach called');

    });
 	 
 	     /**
 	      * @tc.name   SUB_SCROLL_CONTENT_TEST_GET_SIZE_UNDEFINED_0100
 	      * @tc.number SUB_SCROLL_CONTENT_TEST_GET_SIZE_UNDEFINED_0100
 	      * @tc.desc   Determine if the content property is undefined
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL1
 	      */
 	     it('SUB_SCROLL_CONTENT_TEST_GET_SIZE_UNDEFINED_0100', Level.LEVEL0, async (done: Function) => {
 	       console.info('[SUB_SCROLL_CONTENT_TEST_GET_SIZE_UNDEFINED_0100] START');
 	       let driver: Driver = Driver.create();
 	       await CommonFunc.sleep(500);
 	       let button = await driver.findComponent(ON.id('button001'));
 	       await button.click();
 	       await CommonFunc.sleep(1500);
 	 
 	       let strJson = getInspectorByKey('Stop');
 	       let obj: ESObject = JSON.parse(strJson);
 	       console.info('[SUB_SCROLL_CONTENT_TEST_GET_SIZE_UNDEFINED_0100] strJson is: ' + strJson);
 	       console.info('[SUB_SCROLL_CONTENT_TEST_GET_SIZE_UNDEFINED_0100] getCurrentLocalPositionTest obj is: ' + JSON.stringify(obj.$attrs.content));
 	       expect(obj.$attrs.content).assertEqual('0');
 	 
 	       console.info('[SUB_SCROLL_CONTENT_TEST_GET_SIZE_UNDEFINED_0100] END')
 	       done();
 	     });
 	   })
 	 }