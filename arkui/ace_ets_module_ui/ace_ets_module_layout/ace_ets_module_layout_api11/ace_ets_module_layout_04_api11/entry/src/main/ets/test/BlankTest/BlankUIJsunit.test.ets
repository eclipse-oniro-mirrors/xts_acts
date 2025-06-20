/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import GlobalContext from '../../MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function blankUIJsunit() {
  describe('blankUIJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("blankJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Blank/blankParentWidth',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get blankJsunit state pages:" + JSON.stringify(pages));
        if (!("blankParentWidth" == pages.name)) {
          console.info("get blankJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push blankJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push blankJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_ARKUI_BLANK_JSAPI_001
     * @tc.name       Test blankJsunit_0100
     * @tc.desc       Test blank attribute
    */
    it('blankJsunit_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('blankJsunitUITest_0100 START');
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'blankColor',value:'#FCAE5394'})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('bl2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[blankJsunit_0100'] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.color).assertEqual('#FCAE5394');
      done();
    });

    /**
     * @tc.number     SUB_ARKUI_BLANK_JSAPI_002
     * @tc.name       Test blankJsunit_0100
     * @tc.desc       Test blank attribute
     */
   it('blankJsunit_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('blankJsunitUITest_0200 START');
      await CommonFunc.sleep(1000);
       // 动态修改Blank组件的minwidth
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'minWith',value:'80'})
      await CommonFunc.sleep(3000);
      // 获取动态修改后的组件的minwidth
      let strJson = getInspectorByKey('bl2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[blankJsunit_0200'] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.min).assertEqual('80.00vp');
      done();
    });

    it('blankJsunit_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('blankJsunitUITest_0300 START');
      await CommonFunc.sleep(1000);
       // 动态非法修改Blank组件的minwidth
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'minWith',value:'-30'})
      await CommonFunc.sleep(2000);
      // 获取默认的minWidth值
      let strJson = getInspectorByKey('bl2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[blankJsunit_0300'] component obj is: " + obj.$attrs.min);
      // return not the default value to confirm ?
      expect(obj.$attrs.min).assertEqual('0.00vp');
      done();
    });

    it('blankJsunit_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('blankJsunitUITest_0400 START');
      await CommonFunc.sleep(1000);
       // 动态非法修改Blank组件的颜色
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'blankColor',value:'#AE53'})
      await CommonFunc.sleep(3000);
       // 获取非法动态修改后默认组件的颜色
      let strJson = getInspectorByKey('bl2');
      console.info("[blankJsunit_0400'] component obj is: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      // add enum color test case and  confirm the the color  ?
      expect(obj.$attrs.color).assertEqual('#AAEE5533');
      done();
    });

    it('blankJsunit_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('blankJsunitUITest_0500 START');
      await CommonFunc.sleep(1000);
       // 验证父组件不设置宽度，blank失效
      let text1_rect = CommonFunc.getComponentRect('text1');
      let toggle1_rect = CommonFunc.getComponentRect('toggle1');
      let bl1_rect = CommonFunc.getComponentRect('bl1');
      console.info("[blankJsunit_0500'] text1_rect is " + JSON.stringify(text1_rect) + "toggle1_rect is " + JSON.stringify(toggle1_rect) + "bl1.rect is " + JSON.stringify(bl1_rect));
      // 判断blank不显示
      expect(bl1_rect.left - bl1_rect.right).assertEqual(0)
      let strJson = getInspectorByKey('blankUIJsunit_blank');
      let obj: ESObject = JSON.parse(strJson);
       console.info("[blankJsunit_0500'] component obj is: " + strJson);
      expect(obj.$attrs.min).assertEqual('0.00vp');
      done();
    });

    it('blankJsunit_0600',  Level.LEVEL0, async (done: Function) => {
      console.info('blankJsunitUITest_0600 START');
      await CommonFunc.sleep(1000);
       // 验证父组件为row/coloumn 且宽度有，blank平分
      let strJson = getInspectorByKey('blankUIJsunit_blank');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[blankJsunit_0600'] component obj is: " + JSON.stringify(obj));
      let text_rect = CommonFunc.getComponentRect('text');
      let toggle_rect = CommonFunc.getComponentRect('toggle');
      console.info("[blankJsunit_0600'] text_rect is " + JSON.stringify(text_rect) + "toggle_rect is " + JSON.stringify(toggle_rect));
      // 判断blank平分显示
      let gaps = toggle_rect.left - text_rect.right;
      expect(gaps > 0).assertTrue();
      expect(obj.$attrs.min).assertEqual('0.00vp');
      done();
    });

   it('blankJsunit_0700',  Level.LEVEL0, async (done: Function) => {
      console.info('blankJsunitUITest_0700 START');
      await CommonFunc.sleep(1000);
       // 直接判断组件的属性
      let strJson = getInspectorByKey('blankUIJsunit_blank');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[blankJsunit_0700'] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Blank');
      expect(obj.$attrs.color).assertEqual('#00000000');
      expect(obj.$attrs.min).assertEqual('0.00vp');
      done();
    });

    it('blankJsunit_0800',  Level.LEVEL0, async (done: Function) => {
      console.info('blankJsunitUITest_0700 START');
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'minWith',value:'rr'})
      await CommonFunc.sleep(200);
      let strJson2 = getInspectorByKey('bl2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[blankJsunit_0300'] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.min).assertEqual('0.00vp');
      done();

    });


  })
}