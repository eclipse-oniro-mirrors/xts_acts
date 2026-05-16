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
import { TextDecorationOptions } from '@ohos.arkui.component'
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from "../../../../hypium/index";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function TextDecorationStyleTest() {
  describe('TextDecorationStyleTest', () => {
    beforeAll(() => {
      console.info("TextDecorationStyleTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextDecorationStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextDecorationStyleTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get TextDecorationStyleTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextDecorationStyleTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextDecorationStyleTest page error:" + err);
      }
      console.info("TextDecorationStyleTest beforeEach end");
    });


    
    
    


/**
     * @tc.number   TextDecorationStyleTest_static_0001
     * @tc.name     TextDecorationStyleTest_static_0001
     * @tc.desc     TextDecorationStyleTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('TextDecorationStyleTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextDecorationStyleTest0001 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('TextDecorationStyleTextDOTTED');
      let decoration = JSON.parseJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('decoration'));
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.getString('style'));
      expect('' + decoration.getString('style')).assertEqual('TextDecorationStyle.DOTTED');
      console.info("[TextDecorationStyleTest0001] end");
      done();
    });

    
    
    


/**
     * @tc.number   TextDecorationStyleTest_static_0002
     * @tc.name     TextDecorationStyleTest_static_0002
     * @tc.desc     TextDecorationStyleTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('TextDecorationStyleTest_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextDecorationStyleTest0002 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('TextDecorationStyleTextDASHED');
      let decoration = JSON.parseJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('decoration'));
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.getString('style'));
      expect('' + decoration.getString('style')).assertEqual('TextDecorationStyle.DASHED');
      console.info("[TextDecorationStyleTest0002] end");
      done();
    });


    
    
    


/**
     * @tc.number   TextDecorationStyleTest_static_0003
     * @tc.name     TextDecorationStyleTest_static_0003
     * @tc.desc     TextDecorationStyleTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('TextDecorationStyleTest_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextDecorationStyleTest0003 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('TextDecorationStyleSearchDOTTED');
      let decoration = JSON.parseJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('decoration'));
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.getString('style'));
      expect('' + decoration.getString('style')).assertEqual('TextDecorationStyle.DOTTED');
      console.info("[TextDecorationStyleTest0003] end");
      done();
    });


    
    
    


/**
     * @tc.number   TextDecorationStyleTest_static_0004
     * @tc.name     TextDecorationStyleTest_static_0004
     * @tc.desc     TextDecorationStyleTest_static_0004
     * @tc.level    Level.LEVEL0
     */
it('TextDecorationStyleTest_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextDecorationStyleTest0004 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('TextDecorationStyleSearchDASHED');
      let decoration = JSON.parseJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('decoration'));
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.getString('style'));
      expect('' + decoration.getString('style')).assertEqual('TextDecorationStyle.DASHED');
      console.info("[TextDecorationStyleTest0004] end");
      done();
    });


    
    
    


/**
     * @tc.number   TextDecorationStyleTest_static_0005
     * @tc.name     TextDecorationStyleTest_static_0005
     * @tc.desc     TextDecorationStyleTest_static_0005
     * @tc.level    Level.LEVEL0
     */
it('TextDecorationStyleTest_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextDecorationStyleTest0005 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('TextDecorationStyleTextAreaDOTTED');
      let decoration = JSON.parseJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('decoration'));
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.getString('style'));
      expect('' + decoration.getString('style')).assertEqual('TextDecorationStyle.DOTTED');
      console.info("[TextDecorationStyleTest0005] end");
      done();
    });


    
    
    


/**
     * @tc.number   TextDecorationStyleTest_static_0006
     * @tc.name     TextDecorationStyleTest_static_0006
     * @tc.desc     TextDecorationStyleTest_static_0006
     * @tc.level    Level.LEVEL0
     */
it('TextDecorationStyleTest_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextDecorationStyleTest0006 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('TextDecorationStyleTextAreaDASHED');
      let decoration = JSON.parseJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('decoration'));
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.getString('style'));
      expect('' + decoration.getString('style')).assertEqual('TextDecorationStyle.DASHED');
      console.info("[TextDecorationStyleTest0006] end");
      done();
    });


    
    
    


/**
     * @tc.number   TextDecorationStyleTest_static_0007
     * @tc.name     TextDecorationStyleTest_static_0007
     * @tc.desc     TextDecorationStyleTest_static_0007
     * @tc.level    Level.LEVEL0
     */
it('TextDecorationStyleTest_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextDecorationStyleTest0007 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('TextDecorationStyleTextInputDOTTED');
      let decoration = JSON.parseJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('decoration'));
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.getString('style'));
      expect('' + decoration.getString('style')).assertEqual('TextDecorationStyle.DOTTED');
      console.info("[TextDecorationStyleTest0007] end");
      done();
    });


    
    
    


/**
     * @tc.number   TextDecorationStyleTest_static_0008
     * @tc.name     TextDecorationStyleTest_static_0008
     * @tc.desc     TextDecorationStyleTest_static_0008
     * @tc.level    Level.LEVEL0
     */
it('TextDecorationStyleTest_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextDecorationStyleTest0008 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('TextDecorationStyleTextInputDASHED');
      let decoration = JSON.parseJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('decoration'));
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.getString('style'));
      expect('' + decoration.getString('style')).assertEqual('TextDecorationStyle.DASHED');
      console.info("[TextDecorationStyleTest0008] end");
      done();
    });
  })
}