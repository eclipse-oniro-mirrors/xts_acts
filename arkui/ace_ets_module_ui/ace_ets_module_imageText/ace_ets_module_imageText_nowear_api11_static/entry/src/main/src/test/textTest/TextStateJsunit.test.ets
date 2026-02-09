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
import { describe, beforeEach,beforeAll, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function TextStateJsunit() {
  describe('TextStateJsunit', () :void=> {
    beforeAll(() => {
      console.info("TextStateJsunit beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextStateJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/text/TextState",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextStateJsunit state pages:" + "");
        if (!("TextState" == pages.name)) {
          console.info("get TextStateJsunit pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextStateJsunit page error:" + err);
      }
      console.info("TextStateJsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);

      console.info("TextStateJsunit after each called");
    });

    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_0100
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_0100
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_0100', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0100] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_0100');
          console.info('[ArkUX_Stage_Text_TextShadow_0100] strJson',strJson);
          let obj = JSON.parseJsonElement(strJson);
          console.info("--->Text Shadow is :" + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })

    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_0200
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_0200
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_0200', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0200] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info("--->Text Shadow is:" + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_0300
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_0300
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_0300', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0300] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_0400
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_0400
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_0400', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0400] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("20.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })

    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_0500
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_0500
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_0500', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0500] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("5.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_0600
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_0600
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_0600', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0600] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })

    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_0700
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_0700
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_0700', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0700] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF0000FF")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_0800
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_0800
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_0800', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0800] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_0800');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FFFF0000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })

    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_0900
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_0900
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_0900', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0900] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FFFF0000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })

    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_1000
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_1000
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_1000', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1000] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FFFD0000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_1100
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_1100
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_1100', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1100] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_1100');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_1200
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_1200
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_1200', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1200] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_1200');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("5.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_1300
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_1300
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_1300', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1300] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_1300');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("-5.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_1400
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_1400
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_1400', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1400] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_1400');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("5.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_1500
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_1500
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_1500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_1500', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0100] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_1500');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("-5.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_1600
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_1600
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_1600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_1600', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1600] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_1600');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("5.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("5.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_1700
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_1700
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_1700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_1700', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1700] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_1700');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("5.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("-5.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_1800
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_1800
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_1800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_1800', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1800] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_1800');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("-5.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("5.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_1900
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_1900
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_1900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_1900', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1900] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_1900');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("-5.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("-5.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_2000
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_2000
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_2000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_2000', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0100] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_2000');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF0000FF")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("5.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("-5.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_2100
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_2100
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_2100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_2100', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0100] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_2100');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(JSON.stringify(obj.getElement('$attrs').tryGetElement('textShadow'))).assertEqual("{}")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_2200
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_2200
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_2200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_2200', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_2200] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_2200');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FFFF0000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("5.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("5.000000")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_2300
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_2300
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_2300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_2300', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_2300] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_2300');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FFFF0000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_2400
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_2400
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_2400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_2400', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_2400] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_2400');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual("1.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual("0.000000")
          expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual("0.000000")
          done();
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextShadow_static_2500
     * @tc.name     ArkUX_Stage_Text_TextShadow_static_2500
     * @tc.desc     ArkUX_Stage_Text_TextShadow_static_2500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextShadow_static_2500', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextShadow_2500] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextShadow_2500');
          let obj = JSON.parseJsonElement(strJson);
          console.info("--->Text Shadow " + strJson)
          expect(obj.getElement('$attrs').getElement('textShadow')[0].getString('radius')).assertEqual("10.000000")
          expect(obj.getElement('$attrs').getElement('textShadow')[0].getString('color')).assertEqual("#FF000000")
          expect(obj.getElement('$attrs').getElement('textShadow')[0].getString('offsetX')).assertEqual("-10.000000")
          expect(obj.getElement('$attrs').getElement('textShadow')[0].getString('offsetY')).assertEqual("-10.000000")
          expect(obj.getElement('$attrs').getElement('textShadow')[1].getString('radius')).assertEqual("10.000000")
          expect(obj.getElement('$attrs').getElement('textShadow')[1].getString('color')).assertEqual("#FFFF0000")
          expect(obj.getElement('$attrs').getElement('textShadow')[1].getString('offsetX')).assertEqual("10.000000")
          expect(obj.getElement('$attrs').getElement('textShadow')[1].getString('offsetY')).assertEqual("10.000000")
          done();
       }, 500)
    })



    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextOverflow_static_0100
     * @tc.name     ArkUX_Stage_Text_TextOverflow_static_0100
     * @tc.desc     ArkUX_Stage_Text_TextOverflow_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextOverflow_static_0100', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0100] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0100');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->text Overflow is " + JSON.stringify(obj.getElement('$attrs').getString('textOverflow')))
          expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.Clip")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextOverflow_static_0200
     * @tc.name     ArkUX_Stage_Text_TextOverflow_static_0200
     * @tc.desc     ArkUX_Stage_Text_TextOverflow_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextOverflow_static_0200', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0200] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0200');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->text Overflow is " + JSON.stringify(obj.getElement('$attrs').getString('textOverflow')))
          expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.Clip")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextOverflow_static_0300
     * @tc.name     ArkUX_Stage_Text_TextOverflow_static_0300
     * @tc.desc     ArkUX_Stage_Text_TextOverflow_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextOverflow_static_0300', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0300] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0300');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->text Overflow is " + JSON.stringify(obj.getElement('$attrs').getString('textOverflow')))
          expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.Clip")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextOverflow_static_0400
     * @tc.name     ArkUX_Stage_Text_TextOverflow_static_0400
     * @tc.desc     ArkUX_Stage_Text_TextOverflow_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextOverflow_static_0400', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0400] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0400');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->text Overflow is " + JSON.stringify(obj.getElement('$attrs').getString('textOverflow')))
          expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.Ellipsis")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextOverflow_static_0500
     * @tc.name     ArkUX_Stage_Text_TextOverflow_static_0500
     * @tc.desc     ArkUX_Stage_Text_TextOverflow_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextOverflow_static_0500', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0500] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0500');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->text Overflow is " + JSON.stringify(obj.getElement('$attrs').getString('textOverflow')))
          expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.Ellipsis")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextOverflow_static_0600
     * @tc.name     ArkUX_Stage_Text_TextOverflow_static_0600
     * @tc.desc     ArkUX_Stage_Text_TextOverflow_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextOverflow_static_0600', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0600] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0600');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->text Overflow is " + JSON.stringify(obj.getElement('$attrs').getString('textOverflow')))
          expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.None")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextOverflow_static_0700
     * @tc.name     ArkUX_Stage_Text_TextOverflow_static_0700
     * @tc.desc     ArkUX_Stage_Text_TextOverflow_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextOverflow_static_0700', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0700] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0700');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->text Overflow is " + JSON.stringify(obj.getElement('$attrs').getString('textOverflow')))
          expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.Marquee")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextOverflow_static_0800
     * @tc.name     ArkUX_Stage_Text_TextOverflow_static_0800
     * @tc.desc     ArkUX_Stage_Text_TextOverflow_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextOverflow_static_0800', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0800] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0800');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->text Overflow is " + JSON.stringify(obj.getElement('$attrs').getString('textOverflow')))
          expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.Clip")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextOverflow_static_0900
     * @tc.name     ArkUX_Stage_Text_TextOverflow_static_0900
     * @tc.desc     ArkUX_Stage_Text_TextOverflow_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextOverflow_static_0900', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0900] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0900');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->text Overflow is " + JSON.stringify(obj.getElement('$attrs').getString('textOverflow')))
          expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.Clip")
          console.info("--->fontSize is :" + JSON.stringify(obj.getElement('$attrs').getString('fontSize')))
          expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("15.00fp")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextAlign_static_0100
     * @tc.name     ArkUX_Stage_Text_TextAlign_static_0100
     * @tc.desc     ArkUX_Stage_Text_TextAlign_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextAlign_static_0100', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0100] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextAlign_0100');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->textAlign is: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')))
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextAlign_static_0200
     * @tc.name     ArkUX_Stage_Text_TextAlign_static_0200
     * @tc.desc     ArkUX_Stage_Text_TextAlign_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextAlign_static_0200', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0100] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextAlign_0200');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->textAlign is: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')))
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextAlign_static_0300
     * @tc.name     ArkUX_Stage_Text_TextAlign_static_0300
     * @tc.desc     ArkUX_Stage_Text_TextAlign_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextAlign_static_0300', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0300] START');
      setTimeout(() => {

          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextAlign_0300');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->textAlign is: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')))
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextAlign_static_0400
     * @tc.name     ArkUX_Stage_Text_TextAlign_static_0400
     * @tc.desc     ArkUX_Stage_Text_TextAlign_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextAlign_static_0400', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0400] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextAlign_0400');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->textAlign is: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')))
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.End")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextAlign_static_0500
     * @tc.name     ArkUX_Stage_Text_TextAlign_static_0500
     * @tc.desc     ArkUX_Stage_Text_TextAlign_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextAlign_static_0500', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0500] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextAlign_0500');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->textAlign is: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')))
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Justify")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextAlign_static_0600
     * @tc.name     ArkUX_Stage_Text_TextAlign_static_0600
     * @tc.desc     ArkUX_Stage_Text_TextAlign_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextAlign_static_0600', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0600] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextAlign_0600');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->textAlign is: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')))
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_TextAlign_static_0700
     * @tc.name     ArkUX_Stage_Text_TextAlign_static_0700
     * @tc.desc     ArkUX_Stage_Text_TextAlign_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_TextAlign_static_0700', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0700] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_TextAlign_0700');
          let obj = JSON.parseJsonElement(strJson);
          
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.End")
          console.info("--->textAlign is: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')))
          expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual("TextOverflow.Clip")
          console.info("--->textOverflow is: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')))
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_heightAdaptivePolicy_static_0100
     * @tc.name     ArkUX_Stage_Text_heightAdaptivePolicy_static_0100
     * @tc.desc     ArkUX_Stage_Text_heightAdaptivePolicy_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_heightAdaptivePolicy_static_0100', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_heightAdaptivePolicy_0100] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_heightAdaptivePolicy_0100');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text heightAdaptivePolicy is: " +
          JSON.stringify(obj.getElement('$attrs').getString('heightAdaptivePolicy')))
          expect(obj.getElement('$attrs').getString('heightAdaptivePolicy'))
            .assertEqual("TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_heightAdaptivePolicy_static_0200
     * @tc.name     ArkUX_Stage_Text_heightAdaptivePolicy_static_0200
     * @tc.desc     ArkUX_Stage_Text_heightAdaptivePolicy_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_heightAdaptivePolicy_static_0200', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_heightAdaptivePolicy_0200] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_heightAdaptivePolicy_0200');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text heightAdaptivePolicy is: " +
          JSON.stringify(obj.getElement('$attrs').getString('heightAdaptivePolicy')))
          console.info("--->Text heightAdaptivePolicy is: "
            + JSON.stringify(obj.getElement('$attrs').getString('heightAdaptivePolicy')))
          expect(obj.getElement('$attrs').getString('heightAdaptivePolicy'))
            .assertEqual("TextHeightAdaptivePolicy.MAX_LINES_FIRST")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_heightAdaptivePolicy_static_0300
     * @tc.name     ArkUX_Stage_Text_heightAdaptivePolicy_static_0300
     * @tc.desc     ArkUX_Stage_Text_heightAdaptivePolicy_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_heightAdaptivePolicy_static_0300', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_heightAdaptivePolicy_0300] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_heightAdaptivePolicy_0300');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text heightAdaptivePolicy is: " +
          JSON.stringify(obj.getElement('$attrs').getString('heightAdaptivePolicy')))
          expect(obj.getElement('$attrs').getString('heightAdaptivePolicy'))
            .assertEqual("TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_heightAdaptivePolicy_static_0400
     * @tc.name     ArkUX_Stage_Text_heightAdaptivePolicy_static_0400
     * @tc.desc     ArkUX_Stage_Text_heightAdaptivePolicy_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_heightAdaptivePolicy_static_0400', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_heightAdaptivePolicy_0400] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_heightAdaptivePolicy_0400');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text heightAdaptivePolicy is: " +
          JSON.stringify(obj.getElement('$attrs').getString('heightAdaptivePolicy')))
          expect(obj.getElement('$attrs').getString('heightAdaptivePolicy'))
            .assertEqual("TextHeightAdaptivePolicy.MAX_LINES_FIRST")
          done()
       }, 500)
    })


    
    
    
    /**
     * @tc.number   ArkUX_Stage_Text_heightAdaptivePolicy_static_0500
     * @tc.name     ArkUX_Stage_Text_heightAdaptivePolicy_static_0500
     * @tc.desc     ArkUX_Stage_Text_heightAdaptivePolicy_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Text_heightAdaptivePolicy_static_0500', Level.LEVEL1, async (done: ()=> void) => {
      console.info('[ArkUX_Stage_Text_heightAdaptivePolicy_0500] START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_heightAdaptivePolicy_0500');
          let obj = JSON.parseJsonElement(strJson);
          
          console.info("--->Text heightAdaptivePolicy is: " +
          JSON.stringify(obj.getElement('$attrs').getString('heightAdaptivePolicy')))
          expect(obj.getElement('$attrs').getString('heightAdaptivePolicy'))
            .assertEqual("TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST")
          done()
       }, 500)
    })
  })
}
