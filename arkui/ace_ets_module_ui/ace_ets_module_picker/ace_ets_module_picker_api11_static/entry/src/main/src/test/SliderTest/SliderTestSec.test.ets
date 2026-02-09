'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
import { RecordData } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

async function forKey(key: string, text: string) {
  console.info("web afterEach start:" + key);
  try {
    let backData: events_emitter.EventData = {
      data: {
        "value": key,
        "content": text,
      } as Record<String,RecordData>
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId:10,
      priority:events_emitter.EventPriority.LOW
    }
    console.info("start send emitKey");
    events_emitter.emit(backEvent, backData);
  } catch (err) {
    console.info("emit emitKey  err: " + JSON.stringify(err));
  }
  await CommonFunc.sleep(2000);
}
export default function SliderTestSec() {
  describe('SliderTestSec', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/Slider/SliderTestSec",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SliderTestSec state pages:" + JSON.stringify(pages));
        if (!("SliderTestSec" == pages.name)) {
          console.info("get SliderTestSec pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SliderTestSec page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2)
    });



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_0100
     * @tc.name     ArkUX_Stage_Slider_showTips_static_0100
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("true","no");
      await CommonFunc.sleep(1000)
        let strJson = inspector.getInspectorByKey('SliderNoContent');
        console.info('ArkUX_Stage_Slider_showTips_static_0100 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_0100 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_0100 obj $attr :'+ JSON.stringify(obj.getElement('$attrs')));
        console.info('ArkUX_Stage_Slider_showTips_static_0100 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_0100 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetElement('content')).assertEqual(undefined)
        done()

    })

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_0200
     * @tc.name     ArkUX_Stage_Slider_showTips_static_0200
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("false","no");
      await CommonFunc.sleep(1000)
        let strJson = inspector.getInspectorByKey('SliderNoContent');
        console.info('ArkUX_Stage_Slider_showTips_static_0200 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_0200 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_0200 obj $attr :'+ JSON.stringify(obj.getElement('$attrs')));
        console.info('ArkUX_Stage_Slider_showTips_static_0200 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_0200 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("false")
        expect(obj.getElement('$attrs').tryGetElement('content')).assertEqual(undefined)
        done()
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_0300
     * @tc.name     ArkUX_Stage_Slider_showTips_static_0300
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await forKey("falseStr","test");
      await CommonFunc.sleep(1000)
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_0300 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_0300 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_0300 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_0300 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("false")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("test")
        done()

    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_0400
     * @tc.name     ArkUX_Stage_Slider_showTips_static_0400
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("falseStr","ab$12@");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_0400 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_0400 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_0400 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_0400 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("false")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("ab$12@")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_0400 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_0500
     * @tc.name     ArkUX_Stage_Slider_showTips_static_0500
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await forKey("false","ResourceTest");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('SliderResourceTest');
        console.info('ArkUX_Stage_Slider_showTips_static_0500 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_0500 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_0500 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_0500 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("false")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("ResourceTest")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_0500 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_0600
     * @tc.name     ArkUX_Stage_Slider_showTips_static_0600
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("falseStr","");
      await CommonFunc.sleep(1000)
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_0600 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_0600 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_0600 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_0600 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("false")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("")
        done()
    })



     
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_0700
     * @tc.name     ArkUX_Stage_Slider_showTips_static_0700
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("trueStr","test");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_0700 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_0700 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_0700 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_0700 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("test")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_0700 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_0800
     * @tc.name     ArkUX_Stage_Slider_showTips_static_0800
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("trueStr","ab$12@");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_0800 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_0800 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_0800 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_0800 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("ab$12@")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_0800 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_0900
     * @tc.name     ArkUX_Stage_Slider_showTips_static_0900
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await forKey("true","ResourceTest");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('SliderResourceTest');
        console.info('ArkUX_Stage_Slider_showTips_static_0900 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_0900 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_0900 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_0900 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("ResourceTest")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_0900 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_1000
     * @tc.name     ArkUX_Stage_Slider_showTips_static_1000
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("trueStr","");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_1000 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_1000 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_1000 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_1000 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_1300 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_1100
     * @tc.name     ArkUX_Stage_Slider_showTips_static_1100
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("falseStr","no");
      await forKey("trueStr","test");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_1100 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_1100 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_1100 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_1100 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("test")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_1100 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_1200
     * @tc.name     ArkUX_Stage_Slider_showTips_static_1200
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("false","null");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_1200 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_1200 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_1200 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_1200 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("false")
        expect(obj.getElement('$attrs').tryGetElement('content')).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_1200 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_1300
     * @tc.name     ArkUX_Stage_Slider_showTips_static_1300
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("false","undefined");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_1300 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_1300 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_1300 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_1300 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("false")
        expect(obj.getElement('$attrs').tryGetElement('content')).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_1300 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_1400
     * @tc.name     ArkUX_Stage_Slider_showTips_static_1400
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("falseNum","123");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_1400 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_1400 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_1400 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_1400 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("false")
        expect(obj.getElement('$attrs').getString('content') != null).assertTrue()
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_1400 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_1500
     * @tc.name     ArkUX_Stage_Slider_showTips_static_1500
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_1500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("true","null");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_1500 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_1500 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_1500 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_1500 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetElement('content')).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_1400 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_1600
     * @tc.name     ArkUX_Stage_Slider_showTips_static_1600
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("true","undefined");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_1600 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_1600 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_1600 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_1600 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetElement('content')).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_1600 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_1700
     * @tc.name     ArkUX_Stage_Slider_showTips_static_1700
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_1700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("trueNum","123");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_1700 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_1700 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_1700 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_1700 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').getString('content') != null).assertTrue()
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_1700 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_1800
     * @tc.name     ArkUX_Stage_Slider_showTips_static_1800
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_1800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("trueStr","test");
      await CommonFunc.sleep(1000)
      await forKey("true","null");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_1800 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_1800 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_1800 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_1800 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetElement('content')).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_1800 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_1900
     * @tc.name     ArkUX_Stage_Slider_showTips_static_1900
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_1900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      await forKey("true","null");
      await CommonFunc.sleep(1000)
      await forKey("trueStr","test");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_1900 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_1900 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_1900 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_1900 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("test")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_1900 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_2000
     * @tc.name     ArkUX_Stage_Slider_showTips_static_2000
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_2000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let strJson = inspector.getInspectorByKey('SliderNoShowTips');
        console.info('ArkUX_Stage_Slider_showTips_static_2000 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_2000 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_2000 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_2000 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("false")
        expect(obj.getElement('$attrs').tryGetElement('content')).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_2100 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_2100
     * @tc.name     ArkUX_Stage_Slider_showTips_static_2100
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_2100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await forKey("trueStr","aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_2100 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_2100 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_2100 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_2100 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_2100 err  :' + JSON.stringify(err))
        done()
      }
    })



    
    
    /**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_2200
     * @tc.name     ArkUX_Stage_Slider_showTips_static_2200
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_2200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await forKey("trueStr","aaa\nbbb");
      await CommonFunc.sleep(1000)
      try{
        let strJson = inspector.getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_static_2200 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_Slider_showTips_static_2200 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_static_2200 obj $attrs.showTips :'+ JSON.stringify(obj.getElement('$attrs').getString('showTips')));
        console.info('ArkUX_Stage_Slider_showTips_static_2200 obj $attrs.content :'+ JSON.stringify(obj.getElement('$attrs').tryGetString('content')));
        expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
        expect(obj.getElement('$attrs').tryGetString('content')).assertEqual("aaa\nbbb")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_static_2200 err  :' + JSON.stringify(err))
        done()
      }
    })

  })
}