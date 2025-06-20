/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import ohosrouter from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
import {MessageManager, Callback} from '../../../MainAbility/utils/MessageManager';
import { BusinessError } from '@ohos.base';
const waitUiReadyMs = 1000;

export default function swiperAnimationJsunit() {
  describe('swiperAnimationJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperAnimationJsunit beforeEach start");
      done();
      try {
        ohosrouter.clear();
         await CommonFunc.sleep(500);
       let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/index/second',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }

    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPJ_0024
    * @tc.name  : swiperAnimationJsunit_0024
    * @tc.desc  : test whether the onAnimationEnd function triggered
    * @tc.level : Level 2
    */

    it('swiperAnimationJsunit_0024', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationJsunit_0024');
      try {
         ohosrouter.back({url:'MainAbility/pages/index/second'});
         await CommonFunc.sleep(500);
        ohosrouter.clear();
         await CommonFunc.sleep(500);
       let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
      await CommonFunc.sleep(1000);
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0024 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = top -bottom;
      let width = right - left;
      // to swiper
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(Math.round(right- width*0.4),Math.round(bottom + height/2),0,Math.round(bottom + height/2));
      await CommonFunc.sleep(1000);
      // check the onAnimation triggers
      let strJson = getInspectorByKey('animationEnd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0024'] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('End2-->');
      done();
    });
   
    
    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPJ_0012
    * @tc.name  : swiperAnimationJsunit_0012
    * @tc.desc  : test whether the onAnimationStart function triggered when swipe
    * @tc.level : Level 2
    */

   it('swiperAnimationJsunit_0012', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationJsunit_0012 START');
      await CommonFunc.sleep(1000);
      try {
         ohosrouter.back({url:'MainAbility/pages/index/second'});
         await CommonFunc.sleep(500);
        ohosrouter.clear();
         await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
            // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0012 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
      // to swiper
      let driver2 = await Driver.create();
      await CommonFunc.sleep(500);
      await driver2.swipe(Math.round(right- width*0.4),Math.round(bottom + height/2),0,Math.round(bottom + height/2));
      await CommonFunc.sleep(500);
      await driver2.swipe(Math.round(right- width*0.4),Math.round(bottom + height/2),0,Math.round(bottom + height/2));
      await CommonFunc.sleep(500);
       // check the onAnimation triggers
      let strJson = getInspectorByKey('animationStart');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0012'] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Start2-->3');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPJ_0027
    * @tc.name  : swiperAnimationJsunit_0027
    * @tc.desc  : test whether the onAnimationEnd function triggered when autoplay
    * @tc.level : Level 2
    */

   it('swiperAnimationJsunit_0027', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationJsunit_0027 START');
      await CommonFunc.sleep(1000);
      try {
        ohosrouter.back({url:'MainAbility/pages/index/second'});
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          }
          }).then(() => {
              // success
        })
          .catch((err: BusinessError) => {
            console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;

      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0027 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
      //to autoplay
      globalThis.value.message.notify({name:'autoPlay',value:true})
      await CommonFunc.sleep(5000);

      //  to press screen
      let driver3 = await Driver.create();
      await CommonFunc.sleep(200);
      await driver3.longClick(Math.round(right/2),Math.round(bottom + height/2));
      await CommonFunc.sleep(500);
       // check the onAnimation triggers
      let strJson = getInspectorByKey('animationEnd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0027'] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('End2-->');
      done();
    });
     
     /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPJ_0019
    * @tc.name  : swiperAnimationJsunit_0019
    * @tc.desc  : test whether the onAnimationStart function triggered when autoplay
    * @tc.level : Level 2
    */

   it('swiperAnimationJsunit_0019', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationJsunit_0019 START');
      await CommonFunc.sleep(1000);
      try {
       
  ohosrouter.back({url:'MainAbility/pages/index/second'});
  await CommonFunc.sleep(500);
  ohosrouter.clear();
  await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
            // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0019 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
      //to autoplay
      globalThis.value.message.notify({name:'autoPlay',value:true})
      await CommonFunc.sleep(500);

      //  to press screen
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      await driver.longClick(Math.round(right/2),Math.round(bottom + height/2));
      await CommonFunc.sleep(500);
     // to swipe for duration
      await driver.swipe(Math.round(right- width*0.4),Math.round(bottom + height/2),0,Math.round(bottom + height/2));
      await CommonFunc.sleep(500);
      await driver.swipe(Math.round(right- width*0.4),Math.round(bottom + height/2),0,Math.round(bottom + height/2));
      await CommonFunc.sleep(500);

       // check the onAnimation triggers
      let strJson = getInspectorByKey('animationStart');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0019'] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Start2-->3');
      done();
    });

     /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPJ_0022
    * @tc.name  : swiperAnimationJsunit_0022
    * @tc.desc  : test whether the onAnimationEnd function triggered when autoplay
    * @tc.level : Level 2
    */

   it('swiperAnimationJsunit_0022', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationJsunit_0019 START');
      await CommonFunc.sleep(1000);
      try {
        ohosrouter.back({url:'MainAbility/pages/index/second'});
      await CommonFunc.sleep(500);
      ohosrouter.clear();
      await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
            // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0022 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
      //to autoplay
      globalThis.value.message.notify({name:'autoPlay',value:true})
      await CommonFunc.sleep(5000);
       // check the onAnimation triggers
      let strJson = getInspectorByKey('animationStart');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0022'] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Start1-->2');
      done();
    });

     /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPJ_0023
    * @tc.name  : swiperAnimationJsunit_0023
    * @tc.desc  : test whether the onAnimationEnd function triggered 
    * @tc.level : Level 2
    */

   it('swiperAnimationJsunit_0023', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationJsunit_0023 START');
      await CommonFunc.sleep(1000);
      try {
       
             ohosrouter.back({url:'MainAbility/pages/index/second'});
  await CommonFunc.sleep(500);
  ohosrouter.clear();
  await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
            // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0023 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
      // click the previous Button
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let showNext = await driver.findComponent(ON.id('showNext'));
      await showNext.click();
      await CommonFunc.sleep(1000);
      
      let showPrevious = await driver.findComponent(ON.id('showPrevious'));
      await  showPrevious.click();
      await CommonFunc.sleep(1000);

     
       // check the onAnimation triggers
      let strJson = getInspectorByKey('animationEnd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0023'] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('End1-->');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPJ_0011
    * @tc.name  : swiperAnimationJsunit_0011
    * @tc.desc  : test whether the onAnimationStart function triggered 
    * @tc.level : Level 2
    */

   it('swiperAnimationJsunit_0011', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationJsunit_0011 START');
      await CommonFunc.sleep(1000);
      try {
              ohosrouter.back({url:'MainAbility/pages/index/second'});
  await CommonFunc.sleep(500);
  ohosrouter.clear();
  await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
            // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0011 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
      // click the previous Button
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let showNext = await driver.findComponent(ON.id('showNext'));
      await showNext.click();
      await CommonFunc.sleep(1000);
      
      let showPrevious = await driver.findComponent(ON.id('showPrevious'));
      await  showPrevious.click();
      await CommonFunc.sleep(1000);

      let showNext2 = await driver.findComponent(ON.id('showNext'));
      await showNext2.click();
      await CommonFunc.sleep(1000);
       
       // check the onAnimation triggers
      let strJson = getInspectorByKey('animationStart');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0011'] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Start1-->2');
      done();
    });

     /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPJ_0028
    * @tc.name  : swiperAnimationJsunit_0028
    * @tc.desc  : test whether the onAnimationEnd function triggered
    * @tc.level : Level 2
    */

   it('swiperAnimationJsunit_0028', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationJsunit_0011 START');
      await CommonFunc.sleep(1000);
      try {
        ohosrouter.back({url:'MainAbility/pages/index/second'});
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
            // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0028 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
      // click the previous Button
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let showNext = await driver.findComponent(ON.id('showNext'));
      await showNext.click();
      await CommonFunc.sleep(1000);
      
      let showPrevious = await driver.findComponent(ON.id('showPrevious'));
      await  showPrevious.click();
      await CommonFunc.sleep(1000);

      let showNext2 = await driver.findComponent(ON.id('showNext'));
      await showNext2.click();
      await CommonFunc.sleep(1000);

     // press screen to swipe
      await driver.swipe(Math.round(right- width*0.4),Math.round(bottom + height/2),0,Math.round(bottom + height/2));
      await CommonFunc.sleep(500);  


       // check the onAnimation triggers
      let strJson = getInspectorByKey('animationEnd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0028'] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('End3-->');
             
      done();
    });

     /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPJ_0020
    * @tc.name  : swiperAnimationJsunit_0020
    * @tc.desc  : test whether the onAnimationStart function triggered
    * @tc.level : Level 2
    */

   it('swiperAnimationJsunit_0020', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationJsunit_0011 START');
      await CommonFunc.sleep(1000);
      try {
        ohosrouter.back({url:'MainAbility/pages/index/second'});
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);

        let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          }
          }).then(() => {
              // success
          })
          .catch((err: BusinessError) => {
            console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
            // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0020 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
      // click the previous Button
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let showNext = await driver.findComponent(ON.id('showNext'));
      await showNext.click();
      await CommonFunc.sleep(1000);
      
      let showPrevious = await driver.findComponent(ON.id('showPrevious'));
      await  showPrevious.click();
      await CommonFunc.sleep(1000);

      let showNext2 = await driver.findComponent(ON.id('showNext'));
      await showNext2.click();
      await CommonFunc.sleep(1000);

     // press screen to swipe
      await driver.swipe(Math.round(right- width*0.4),Math.round(bottom + height/2),0,Math.round(bottom + height/2));
      await CommonFunc.sleep(3000);
     await driver.swipe(Math.round(left + width*0.4),Math.round(bottom + height/2),Math.round(left + width*0.4),Math.round(bottom + height/2));

      await CommonFunc.sleep(500);

       // check the onAnimation triggers
      let strJson = getInspectorByKey('animationStart');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0020'] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Start2-->3');

      done();
    });

    /**
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPL_0016
    * @tc.name  : swiperAnimationGestureJsunit_0016
    * @tc.desc  : test whether the onGestureSwipe function triggered when swipe
    * @tc.level : Level 2
    */

   it('swiperAnimationGestureJsunit_0016', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationGestureJsunit_0016 START');
      await CommonFunc.sleep(1000);
      try {
       
  ohosrouter.back({url:'MainAbility/pages/index/second'});
  await CommonFunc.sleep(500);
  ohosrouter.clear();
  await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
            // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationGestureJsunit_0016 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
    
      // to swiper
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
     // getComponentRectOnScreen
     await driver.swipe(Math.round(right- width*0.4),Math.round(bottom + height/2),0,Math.round(bottom + height/2));

      await CommonFunc.sleep(1000);
       // check the onAnimation triggers
      let strJson = getInspectorByKey('GestureSwipe');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationGestureJsunit_0016] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('GestureSwipe index: 1');
      done();
    });

    /**
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPL_0017
    * @tc.name  : swiperAnimationGestureJsunit_0017
    * @tc.desc  : test whether the onGestureSwipe function triggered when swipe
    * @tc.level : Level 2
    */

   it('swiperAnimationGestureJsunit_0017', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationGestureJsunit_0017 START');
      await CommonFunc.sleep(1000);
      try {
       
  ohosrouter.back({url:'MainAbility/pages/index/second'});
  await CommonFunc.sleep(500);
  ohosrouter.clear();
  await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
            // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0017 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
      // to swiper
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(Math.round(right- width*0.4),Math.round(bottom + height/2),0,Math.round(bottom + height/2));
      await CommonFunc.sleep(500);
       // check the onAnimation triggers
      let strJson = getInspectorByKey('GestureSwipe');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0017'] component obj2 is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('GestureSwipe index: 1');
      await driver.swipe(Math.round(left + width*0.4), Math.round(bottom + height/2),Math.round(left + width*0.4),Math.round(bottom + height/2));
      await CommonFunc.sleep(500);
      let strJson2 = getInspectorByKey('GestureSwipe');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[swiperAnimationJsunit_0012'] component obj3 is: " + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('GestureSwipe index: 1');
      done();
    });
    
    /**
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPL_0019
    * @tc.name  : swiperAnimationGestureJsunit_0019
    * @tc.desc  : test whether the onGestureSwipe function triggered when swipe
    * @tc.level : Level 2
    */

   it('swiperAnimationGestureJsunit_0019', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationGestureJsunit_0019 START');
      await CommonFunc.sleep(1000);
      try {
       
  ohosrouter.back({url:'MainAbility/pages/index/second'});
  await CommonFunc.sleep(500);
  ohosrouter.clear();
  await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
            // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0019 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
      //to autoplay
      globalThis.value.message.notify({name:'autoPlay',value:true})
      await CommonFunc.sleep(500);
      // to swiper
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(Math.round(right- width*0.4),Math.round(bottom + height/2),0,Math.round(bottom + height/2));
      await CommonFunc.sleep(500);
       // check the onAnimation triggers
      let strJson = getInspectorByKey('GestureSwipe');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0019'] component obj2 is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('GestureSwipe index: 1');
      await driver.swipe(Math.round(left + width*0.4), Math.round(bottom + height/2),Math.round(left + width*0.4),Math.round(bottom + height/2));
      await CommonFunc.sleep(500);
      let strJson2 = getInspectorByKey('GestureSwipe');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[swiperAnimationJsunit_0019'] component obj3 is: " + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('GestureSwipe index: 1');
      done();
    });

     /**
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IAHPL_0020
    * @tc.name  : swiperAnimationGestureJsunit_0020
    * @tc.desc  : test whether the onGestureSwipe function triggered when swipe
    * @tc.level : Level 2
    */

   it('swiperAnimationGestureJsunit_0020', Level.LEVEL1, async (done: Function) => {
      console.info('swiperAnimationGestureJsunit_0020 START');
      await CommonFunc.sleep(1000);
      try {
       
  ohosrouter.back({url:'MainAbility/pages/index/second'});
  await CommonFunc.sleep(500);
  ohosrouter.clear();
  await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          } ).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
         await CommonFunc.sleep(2000);
      } catch (err) {
         console.error("push circle page error: " + err);
      }
            // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_0020 value is" + left + " --" + right + "--" + top + "--" + bottom);
       
      let height = top -bottom;
      let width = right - left;
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let showNext = await driver.findComponent(ON.id('showNext'));
      await showNext.click();
      await CommonFunc.sleep(1000);
      
      let showPrevious = await driver.findComponent(ON.id('showPrevious'));
      await  showPrevious.click();
      await CommonFunc.sleep(1000);

      let showNext2 = await driver.findComponent(ON.id('showNext'));
      await showNext2.click();
      await CommonFunc.sleep(1000);

      // to swiper
      await driver.swipe(Math.round(right- width*0.4),Math.round(bottom + height/2),0,Math.round(bottom + height/2));
      await CommonFunc.sleep(3000);
       //check the onAnimation triggers
      let strJson = getInspectorByKey('GestureSwipe');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[swiperAnimationJsunit_0020'] component obj2 is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('GestureSwipe index: 2');
      await driver.swipe(Math.round(left + width*0.4), Math.round(bottom + height/2),Math.round(left + width*0.4),Math.round(bottom + height/2));
      await CommonFunc.sleep(500);
      let strJson2 = getInspectorByKey('GestureSwipe');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[swiperAnimationJsunit_0020'] component obj3 is: " + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('GestureSwipe index: 2');
      done();
    });

  })


}