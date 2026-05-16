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
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Point
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Color } from '@ohos.arkui.component';
let emitKey = "emitUserAgent";
export default function buttonTest() {
  describe('ActsButtonTest', () => {

    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/button/ButtonIndex",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Select state pages:" + JSON.stringify(pages));
        if (!("ButtonIndex" == pages.name)) {
          console.info("get Select pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Select page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Select page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("select beforeEach start");
    })

    
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_0100
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_0100
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_FA_Button_TextOverFlow_0100 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0100');
          console.info('ArkUX_Stage_Button_LabelStyle_0100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0100 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_0100 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_0200
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_0200
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_0200 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0200');
          console.info('ArkUX_Stage_Button_LabelStyle_0200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0200 component obj.getElement('$attrs').fontWeight is: " +
          JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_0200 component obj.getElement('$attrs').getString('labelStyle') is: " +
          JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_0200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_0300
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_0300
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_0300 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0300');
          console.info('ArkUX_Stage_Button_LabelStyle_0300 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0300 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_0300 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_0300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_0400
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_0400
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_0400 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0400');
          console.info('ArkUX_Stage_Button_LabelStyle_0400 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0400 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_0400 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_0400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_0500
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_0500
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_0500 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0500');
          console.info('ArkUX_Stage_Button_LabelStyle_0500 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0500 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_0500 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_0500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  	
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_0600
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_0600
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_0600 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0600');
          console.info('ArkUX_Stage_Button_LabelStyle_0600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0600 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_0600 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_0600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  	
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_0700
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_0700
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_0700 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0700');
          console.info('ArkUX_Stage_Button_LabelStyle_0700 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0700 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_0700 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_0700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  	
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_0800
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_0800
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_0800 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0800');
          console.info('ArkUX_Stage_Button_LabelStyle_0800 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0800 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_0800 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_0800 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0800 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_0900
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_0900
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_0900 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_0900');
          console.info('ArkUX_Stage_Button_LabelStyle_0900 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_0900 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_0900 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_0900 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_0900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_1000
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_1000
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_1000 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1000');
          console.info('ArkUX_Stage_Button_LabelStyle_1000 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1000 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_1000 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_1000 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1000 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_1100
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_1100
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_1100 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1100');
          console.info('ArkUX_Stage_Button_LabelStyle_1100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1100 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_1100 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_1100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  	
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_1200
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_1200
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_1200 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1200');
          console.info('ArkUX_Stage_Button_LabelStyle_1200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1200 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_1200 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_1200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_1300
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_1300
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_1300 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1300');
          console.info('ArkUX_Stage_Button_LabelStyle_1300 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1300 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_1300 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_1300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_1400
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_1400
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_1400 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1400');
          console.info('ArkUX_Stage_Button_LabelStyle_1400 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1400 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_1400 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_1400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  	
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_1500
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_1500
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_1500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_1500 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1500');
          console.info('ArkUX_Stage_Button_LabelStyle_1500 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1500 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_1500 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_1500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_1600
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_1600
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_1600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_1600 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1600');
          console.info('ArkUX_Stage_Button_LabelStyle_1600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1600 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_1600 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_1600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_1700
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_1700
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_1700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_1700 START');
      setTimeout(()=>{
        try{
          console.info('ArkUX_Stage_Button_LabelStyle_1700 START 111');
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1700');
          console.info('ArkUX_Stage_Button_LabelStyle_1700 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1700 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_1700 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_1700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_1800
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_1800
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_1800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_1800 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1800');
          console.info('ArkUX_Stage_Button_LabelStyle_1800 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1800 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_1800 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_1800 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1800 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
	
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_1900
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_1900
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_1900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_1900 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_1900');
          console.info('ArkUX_Stage_Button_LabelStyle_1900 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_1900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_1900 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_1900 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_1900 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_1900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_2000
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_2000
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_2000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_2000 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2000');
          console.info('ArkUX_Stage_Button_LabelStyle_2000 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2000 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_2000 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_2000 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2000 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_2100
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_2100
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_2100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_2100 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2100');
          console.info('ArkUX_Stage_Button_LabelStyle_2100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2100 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_2100 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_2100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_2200
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_2200
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_2200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_2200 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2200');
          console.info('ArkUX_Stage_Button_LabelStyle_2200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2200 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_2200 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_2200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_2300
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_2300
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_2300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_2300 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2300');
          console.info('ArkUX_Stage_Button_LabelStyle_2300 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2300 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_2300 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_2300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_2400
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_2400
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_2400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_2400 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2400');
          console.info('ArkUX_Stage_Button_LabelStyle_2400 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2400 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_2400 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_2400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  	
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_2500
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_2500
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_2500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_2500 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2500');
          console.info('ArkUX_Stage_Button_LabelStyle_2500 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2500 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_2500 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_2500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_2600
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_2600
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_2600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_2600 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2600');
          console.info('ArkUX_Stage_Button_LabelStyle_2600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2600 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_2600 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_2600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_2700
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_2700
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_2700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_2700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_2700 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2700');
          console.info('ArkUX_Stage_Button_LabelStyle_2700 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2700 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_2700 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_2700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
	
  	
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_2800
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_2800
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_2800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_2800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_2800 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2800');
          console.info('ArkUX_Stage_Button_LabelStyle_2800 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2800 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_2800 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.None");
          console.info('ArkUX_Stage_Button_LabelStyle_2800 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2800 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

	  
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_2900
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_2900
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_2900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_2900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_2900 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_2900');
          console.info('ArkUX_Stage_Button_LabelStyle_2900 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_2900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_2900 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_2900 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Clip");
          console.info('ArkUX_Stage_Button_LabelStyle_2900 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_2900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  	
    
/**
     * @tc.number   ArkUX_Stage_Button_LabelStyle_static_3000
     * @tc.name     ArkUX_Stage_Button_LabelStyle_static_3000
     * @tc.desc     ArkUX_Stage_Button_LabelStyle_static_3000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_Button_LabelStyle_static_3000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Button_LabelStyle_3000 START');
      setTimeout(()=>{
        try{
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Button_LabelStyle_3000');
          console.info('ArkUX_Stage_Button_LabelStyle_3000 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Button_LabelStyle_3000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Button_LabelStyle_3000 component obj.getElement('$attrs').textOverflow is: " +
                       JSON.stringify(obj.getElement('$attrs').getString('labelStyle')));
          let labelStyle = JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle'))
          console.info("ArkUX_Stage_Button_LabelStyle_3000 component obj.getElement('$attrs').getString('labelStyle') is: " +
                       JSON.stringify(labelStyle));
          expect(labelStyle.getString('overflow')).assertEqual("TextOverflow.Ellipsis");
          console.info('ArkUX_Stage_Button_LabelStyle_3000 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Button_LabelStyle_3000 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
  })
}
