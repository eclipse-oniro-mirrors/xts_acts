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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect} from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
import events_emitter from '@ohos.events.emitter'
export default function AnimationJsunit() {
  describe('AnimationJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("AnimationJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Animation/Animation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AnimationJsunit state pages: " + JSON.stringify(pages));
        if (!("overlay" == pages.name)) {
          console.info("get AnimationJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AnimationJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AnimationJsunit page error:" + err);
      }
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });
    /**
     * @tc.name   AnimationJsunit_0100
     * @tc.number SUB_ACE_TS_COMPONENT_AR000IGJGH_01
     * @tc.desc   Does the component size change after playback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AnimationJsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[AnimationJsunit_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await scrollBar.scrollSearch(ON.id('interpolating-springn'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let button_Bottom2 = await scrollBar.scrollSearch(ON.id('create'));
      await button_Bottom2.click();
      await CommonFunc.sleep(1000);
      let button_Bottom3 = await scrollBar.scrollSearch(ON.id('play'));
      await button_Bottom3.click();
      await CommonFunc.sleep(1000);
      let finishBtn = await scrollBar.scrollSearch(ON.id('finish'));
      await finishBtn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onframe-value');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[AnimationJsunit_0100] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content>'100').assertTrue();
      console.info('[AnimationJsunit_0100] END');
      done();
    });
	 
  /**
   * @tc.name   AnimationJsunit_0200
   * @tc.number AnimationJsunit_0200
   * @tc.desc   AnimationJsunit_0200
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
	 it('AnimationJsunit_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[AnimationJsunit_0200] START');
      let driver = await Driver.create()
	  await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await scrollBar.scrollSearch(ON.id('interpolating-springn'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
	  let button_Bottom2 = await scrollBar.scrollSearch(ON.id('create'));
      await button_Bottom2.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom3 = await scrollBar.scrollSearch(ON.id('play'));
      await button_Bottom3.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom4 = await scrollBar.scrollSearch(ON.id('cancel'));
      await button_Bottom4.click();
	  await CommonFunc.sleep(1000);
	  let strJson = getInspectorByKey('onframe-value');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[AnimationJsunit_0200] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content==='200').assertTrue();
      console.info('[AnimationJsunit_0200] END');
      done();
    });
	
	
 /**
  * @tc.name   AnimationJsunit_0300
  * @tc.number AnimationJsunit_0300
  * @tc.desc   AnimationJsunit_0300
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('AnimationJsunit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[AnimationJsunit_0300] START');
      let driver = await Driver.create()
	  await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await scrollBar.scrollSearch(ON.id('interpolating-springn'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
	  let button_Bottom2 = await scrollBar.scrollSearch(ON.id('create'));
      await button_Bottom2.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom3 = await scrollBar.scrollSearch(ON.id('play'));
      await button_Bottom3.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom4 = await scrollBar.scrollSearch(ON.id('pause'));
      await button_Bottom4.click();
	  await CommonFunc.sleep(1000);
	  let strJson = getInspectorByKey('onframe-value');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[AnimationJsunit_0300] obj is: " + JSON.stringify(obj.$attrs.content));
	  await CommonFunc.sleep(1000);
	  let strJson2 = getInspectorByKey('onframe-value');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
	  console.info("[AnimationJsunit_0300] obj2 is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj.$attrs.content===obj2.$attrs.content).assertTrue();
      console.info('[AnimationJsunit_0300] END');
      done();
    });
	
	
 /**
  * @tc.name   AnimationJsunit_0400
  * @tc.number AnimationJsunit_0400
  * @tc.desc   AnimationJsunit_0400
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('AnimationJsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[AnimationJsunit_0400] START');
      let driver2 = await Driver.create()
	  await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver2.findComponent(ON.type('Scroll'));
      let button_Bottom = await scrollBar.scrollSearch(ON.id('interpolating-springn'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
	  let button_Bottom2 = await scrollBar.scrollSearch(ON.id('create'));
      await button_Bottom2.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom3 = await scrollBar.scrollSearch(ON.id('play'));
      await button_Bottom3.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom4 = await scrollBar.scrollSearch(ON.id('finish'));
      await button_Bottom4.click();
	  await CommonFunc.sleep(1000);
	  let onframe = await scrollBar.scrollSearch(ON.id('onframe-value'));
      let content =await  onframe.getText()
	  console.info("[AnimationJsunit_0400] obj3 is: " + JSON.stringify(content))
      expect(content==='200').assertTrue();
      console.info('[AnimationJsunit_0400] END');
      done();
    });
	
	
 /**
  * @tc.name   AnimationJsunit_0500
  * @tc.number AnimationJsunit_0500
  * @tc.desc   AnimationJsunit_0500
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('AnimationJsunit_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[AnimationJsunit_0500] START');
      let driver = await Driver.create()
	  await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await scrollBar.scrollSearch(ON.id('velocity'));
      await button_Bottom.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom2 = await scrollBar.scrollSearch(ON.id('stiffness'));
      await button_Bottom2.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom3 = await scrollBar.scrollSearch(ON.id('damping'));
      await button_Bottom3.click();
	  await CommonFunc.sleep(1000);
      let button_Bottom4 = await scrollBar.scrollSearch(ON.id('interpolating-springn'));
      await button_Bottom4.click();
      await CommonFunc.sleep(1000);
	  let button_Bottom5 = await scrollBar.scrollSearch(ON.id('create'));
      await button_Bottom5.click();
	  await CommonFunc.sleep(1000);
	  let curve = await scrollBar.scrollSearch(ON.id('curve'));
      let content =await  curve.getText()
      console.info("[AnimationJsunit_0500] obj is: " + JSON.stringify(content));
      expect(content).assertEqual('curve:interpolating-spring\(10,1,1,15\)');
      console.info('[AnimationJsunit_0500] END');
      done();
    });
	
	
 /**
  * @tc.name   AnimationJsunit_0600
  * @tc.number AnimationJsunit_0600
  * @tc.desc   AnimationJsunit_0600
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('AnimationJsunit_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[AnimationJsunit_0600] START');
      let driver = await Driver.create()
	  await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await scrollBar.scrollSearch(ON.id('interpolating-springn'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
	  let button_Bottom2 = await scrollBar.scrollSearch(ON.id('create'));
      await button_Bottom2.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom3 = await scrollBar.scrollSearch(ON.id('play'));
      await button_Bottom3.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom4 = await scrollBar.scrollSearch(ON.id('cancel'));
      await button_Bottom4.click();
	  await CommonFunc.sleep(2000);
	  let backAnimator = await scrollBar.scrollSearch(ON.id('backAnimator-onback'));
      let content =await  backAnimator.getText()
      console.info("[AnimationJsunit_0600] obj2 is: " + JSON.stringify(content));
      expect(content).assertEqual('backAnimator-onback:oncancel');
      console.info('[AnimationJsunit_0600] END');
      done();
    });
	
	
 /**
  * @tc.name   AnimationJsunit_0700
  * @tc.number AnimationJsunit_0700
  * @tc.desc   AnimationJsunit_0700
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('AnimationJsunit_0700', Level.LEVEL0, async (done: Function) => {
      console.info('[AnimationJsunit_0700] START');
      let driver = await Driver.create()
	  await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await scrollBar.scrollSearch(ON.id('interpolating-springn'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
	  let button_Bottom2 = await scrollBar.scrollSearch(ON.id('create'));
      await button_Bottom2.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom3 = await scrollBar.scrollSearch(ON.id('play'));
      await button_Bottom3.click();
	  await CommonFunc.sleep(1000);
	  let button_Bottom4 = await scrollBar.scrollSearch(ON.id('finish'));
      await button_Bottom4.click();
	  await CommonFunc.sleep(2000);
	  let backAnimator = await scrollBar.scrollSearch(ON.id('backAnimator-onback'));
      let content =await  backAnimator.getText()
      console.info("[AnimationJsunit_0700] obj3 is: " + JSON.stringify(content));
      expect(content).assertEqual('backAnimator-onback:onfinish');
      console.info('[AnimationJsunit_0700] END');
      done();
    });
  })
}