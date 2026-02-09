'use static';
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
import {SideBarContainerType} from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../../hypium/index';
import router from '@ohos.router';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import Utils from '../../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function SideBarContainerTypeTest() {
  describe('SideBarContainerTypeTest', () => {
    beforeAll(() => {
      console.info("SideBarContainerTypeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("SideBarContainerType beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/SideBarContainerType/SideBarContainerType',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
       
        let pages = routerInstance.getState();
        console.info("get SideBarContainerType state pages:" + JSON.stringify(pages));
        if (!("SideBarContainerType" == pages.name)) {
          console.info("get SideBarContainerType pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SideBarContainerType page error:" + err);
      }
      console.info("SideBarContainerType beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SideBarContainerTypeTest after each called");
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainerType_static_0100
     * @tc.name     SUB_ACE_SideBarContainerType_static_0100
     * @tc.desc     SUB_ACE_SideBarContainerType_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainerType_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainerType_0100] START');
      await CommonFunc.sleep(2000);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(150))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left:" + (SideBar_01.right - SideBar_01.left))
      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(549))) <= 1).assertTrue();
      console.log('sideBarContent_01.right - sideBarContent_01.left:' + (sideBarContent_01.right - sideBarContent_01.left))

      console.info('[SUB_ACE_SideBarContainerType_0100] END');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainerType_static_0200
     * @tc.name     SUB_ACE_SideBarContainerType_static_0200
     * @tc.desc     SUB_ACE_SideBarContainerType_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainerType_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainerType_0200] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width1', value: 400
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(sideBarContent_01.left).assertEqual(SideBarContainer_01.left);
      console.log("sideBarContent_01.left" + sideBarContent_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(400))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + ((Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(400)))))

      console.info('[SUB_ACE_SideBarContainerType_0200] END');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainerType_static_0300
     * @tc.name     SUB_ACE_SideBarContainerType_static_0300
     * @tc.desc     SUB_ACE_SideBarContainerType_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainerType_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainerType_0300] START');
      AppStorage.get<MessageManager<SideBarContainerType>>('messageManager')?.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.Overlay
      })
      await CommonFunc.sleep(1000);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_011: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      expect(sideBarContent_011.left).assertEqual(SideBarContainer_01.left);
      console.log("sideBarContent_011.left" + sideBarContent_011.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(150))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      let strJson1 = inspector.getInspectorByKey('SideBarContainerType_SideBarContainer_01');

      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type')).assertEqual('SideBarContainerType.OVERLAY');
      console.log(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type'))

      console.info('[SUB_ACE_SideBarContainerType_0300] END');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainerType_static_0400
     * @tc.name     SUB_ACE_SideBarContainerType_static_0400
     * @tc.desc     SUB_ACE_SideBarContainerType_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainerType_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainerType_0400] START');
      AppStorage.get<MessageManager<SideBarContainerType>>('messageManager')?.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.Overlay
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width1', value: 400
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      expect(sideBarContent_01.left).assertEqual(SideBarContainer_01.left);
      console.log("sideBarContent_01.left" + sideBarContent_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(150))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(400))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      let strJson1 = inspector.getInspectorByKey('SideBarContainerType_SideBarContainer_01');

      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type')).assertEqual('SideBarContainerType.OVERLAY');
      console.log(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type'))

      console.info('[SUB_ACE_SideBarContainerType_0400] END');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainerType_static_0500
     * @tc.name     SUB_ACE_SideBarContainerType_static_0500
     * @tc.desc     SUB_ACE_SideBarContainerType_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainerType_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainerType_0500] START');
      AppStorage.get<MessageManager<SideBarContainerType>>('messageManager')?.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.Overlay
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width1', value: 400
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'minContentWidth', value: 100
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'minSideBarWidth', value: 400
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      expect(sideBarContent_01.left).assertEqual(SideBarContainer_01.left);
      console.log("sideBarContent_01.left" + sideBarContent_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)


      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(400))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(400))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      let strJson1 = inspector.getInspectorByKey('SideBarContainerType_SideBarContainer_01');

      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type')).assertEqual('SideBarContainerType.OVERLAY');
      console.log(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type'))

      console.info('[SUB_ACE_SideBarContainerType_0500] END');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainerType_static_0600
     * @tc.name     SUB_ACE_SideBarContainerType_static_0600
     * @tc.desc     SUB_ACE_SideBarContainerType_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainerType_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainerType_0600] START');
      AppStorage.get<MessageManager<SideBarContainerType>>('messageManager')?.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.AUTO
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width1', value: 500
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'minContentWidth', value: 300
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'minSideBarWidth', value: 200
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(200))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(300))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      console.info('[SUB_ACE_SideBarContainerType_0600] END');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainerType_static_0700
     * @tc.name     SUB_ACE_SideBarContainerType_static_0700
     * @tc.desc     SUB_ACE_SideBarContainerType_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainerType_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainerType_0700] START');
      AppStorage.get<MessageManager<SideBarContainerType>>('messageManager')?.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.AUTO
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width1', value: 400
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'minContentWidth', value: 300
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'minSideBarWidth', value: 200
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      expect(sideBarContent_01.left).assertEqual(SideBarContainer_01.left);
      console.log("sideBarContent_01.left" + sideBarContent_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(200))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(400))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      let strJson1 = inspector.getInspectorByKey('SideBarContainerType_SideBarContainer_01');

      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type')).assertEqual('SideBarContainerType.OVERLAY');
      console.log(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type'))

      console.info('[SUB_ACE_SideBarContainerType_0700] END');
      done();
    });


    
// /*
//      * @tc.number   SUB_ACE_SideBarContainerType_static_1000
//      * @tc.name     SUB_ACE_SideBarContainerType_static_1000
//      * @tc.desc     SUB_ACE_SideBarContainerType_static_1000
//      * @tc.level    Level.LEVEL0
//      */
//     it('SUB_ACE_SideBarContainerType_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
//       console.info('[SUB_ACE_SideBarContainerType_1000] START');
//       let context = AppStorage.get<UIContext>("context") as UIContext
//       AppStorage.get<MessageManager<SideBarContainerType>>('messageManager')?.notify({
//         name: 'SideBarContainerType', value: SideBarContainerType.AUTO
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'width1', value: 200 + context.px2vp(100)
//       })
//       AppStorage.get<MessageManager<string>>('messageManager')?.notify({
//         name: 'minContentWidth', value: '100px'
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'minSideBarWidth', value: 200
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'maxSideBarWidth', value: 300
//       })
//       await CommonFunc.sleep(500);
//       console.log("get Initial value")
//       let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
//       let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
//       let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');
//
//
//       console.log("assert width")
//       expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(200))) <= 1).assertTrue();
//       console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
//       expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(100)) <= 1).assertTrue();
//       console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))
//
//       console.info('[SUB_ACE_SideBarContainerType_1000] END');
//       done();
//     });


    
// /*
//      * @tc.number   SUB_ACE_SideBarContainerType_static_1100
//      * @tc.name     SUB_ACE_SideBarContainerType_static_1100
//      * @tc.desc     SUB_ACE_SideBarContainerType_static_1100
//      * @tc.level    Level.LEVEL0
//      */
//     it('SUB_ACE_SideBarContainerType_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
//       console.info('[SUB_ACE_SideBarContainerType_1100] START');
//       AppStorage.get<MessageManager<SideBarContainerType>>('messageManager')?.notify({
//         name: 'SideBarContainerType', value: SideBarContainerType.AUTO
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'width1', value: 300
//       })
//       AppStorage.get<MessageManager<string>>('messageManager')?.notify({
//         name: 'minContentWidth', value: '100vp'
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'minSideBarWidth', value: 200
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'maxSideBarWidth', value: 300
//       })
//       await CommonFunc.sleep(500);
//       console.log("get Initial value")
//       let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
//       let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
//       let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');
//
//       console.log("assert width")
//       expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(200))) <= 1).assertTrue();
//       console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
//       expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(100))) <= 1).assertTrue();
//       console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))
//
//       console.info('[SUB_ACE_SideBarContainerType_1100] END');
//       done();
//     });



    
// /*
//      * @tc.number   SUB_ACE_SideBarContainerType_static_1200
//      * @tc.name     SUB_ACE_SideBarContainerType_static_1200
//      * @tc.desc     SUB_ACE_SideBarContainerType_static_1200
//      * @tc.level    Level.LEVEL0
//      */
//     it('SUB_ACE_SideBarContainerType_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
//       console.info('[SUB_ACE_SideBarContainerType_1200] START');
//       AppStorage.get<MessageManager<SideBarContainerType>>('messageManager')?.notify({
//         name: 'SideBarContainerType', value: SideBarContainerType.AUTO
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'width1', value: 200
//       })
//       AppStorage.get<MessageManager<string>>('messageManager')?.notify({
//         name: 'minContentWidth', value: '0vp'
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'minSideBarWidth', value: 200
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'maxSideBarWidth', value: 300
//       })
//       await CommonFunc.sleep(500);
//       console.log("get Initial value")
//       let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
//       let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
//       let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');
//
//       console.log("assert width")
//       expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(200))) <= 1).assertTrue();
//       console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
//       expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(0)) <= 1).assertTrue();
//       console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))
//
//       console.info('[SUB_ACE_SideBarContainerType_1200] END');
//       done();
//     });



    
// /*
//      * @tc.number   SUB_ACE_SideBarContainerType_static_1300
//      * @tc.name     SUB_ACE_SideBarContainerType_static_1300
//      * @tc.desc     SUB_ACE_SideBarContainerType_static_1300
//      * @tc.level    Level.LEVEL0
//      */
//     it('SUB_ACE_SideBarContainerType_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
//       console.info('[SUB_ACE_SideBarContainerType_1300] START');
//       AppStorage.get<MessageManager<SideBarContainerType>>('messageManager')?.notify({
//         name: 'SideBarContainerType', value: SideBarContainerType.AUTO
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'width1', value: 300
//       })
//       AppStorage.get<MessageManager<string>>('messageManager')?.notify({
//         name: 'minContentWidth', value: '10%'
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'minSideBarWidth', value: 270
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'maxSideBarWidth', value: 300
//       })
//       await CommonFunc.sleep(500);
//       console.log("get Initial value")
//       let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
//       let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
//       let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');
//
//       console.log("assert width")
//       expect(Math.abs((SideBar_01.right - SideBar_01.left) - AppStorage.get<UIContext>('uiContext')!.vp2px(270)) <= 1).assertTrue();
//       console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
//       expect(Math.abs((sideBarContent_01.right - sideBarContent_01.left) - AppStorage.get<UIContext>('uiContext')!.vp2px(30)) <= 1).assertTrue();
//       console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))
//
//       console.info('[SUB_ACE_SideBarContainerType_1300] END');
//       done();
//     });



    
// /*
//      * @tc.number   SUB_ACE_SideBarContainerType_static_1400
//      * @tc.name     SUB_ACE_SideBarContainerType_static_1400
//      * @tc.desc     SUB_ACE_SideBarContainerType_static_1400
//      * @tc.level    Level.LEVEL0
//      */
//     it('SUB_ACE_SideBarContainerType_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
//       console.info('[SUB_ACE_SideBarContainerType_1400] START');
//       AppStorage.get<MessageManager<SideBarContainerType>>('messageManager')?.notify({name:'SideBarContainerType', value:SideBarContainerType.AUTO})
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({name:'width1', value:300})
//       AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'minContentWidth', value:'120%'})
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({name:'minSideBarWidth', value:270})
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({name:'maxSideBarWidth', value:300})
//       await CommonFunc.sleep(500);
//       console.log("get Initial value")
//       let SideBar_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
//       let sideBarContent_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
//       let SideBarContainer_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');
//
//
//       console.log("assert width")
//       expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(270)));
//       console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
//       expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(360)));
//       console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))
//
//       console.info('[SUB_ACE_SideBarContainerType_1400] END');
//       done();
//     });


    
// /*
//      * @tc.number   SUB_ACE_SideBarContainerType_static_1500
//      * @tc.name     SUB_ACE_SideBarContainerType_static_1500
//      * @tc.desc     SUB_ACE_SideBarContainerType_static_1500
//      * @tc.level    Level.LEVEL0
//      */
//     it('SUB_ACE_SideBarContainerType_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
//       console.info('[SUB_ACE_SideBarContainerType_1500] START');
//       AppStorage.get<MessageManager<SideBarContainerType>>('messageManager')?.notify({
//         name: 'SideBarContainerType', value: SideBarContainerType.AUTO
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'width1', value: 560
//       })
//       AppStorage.get<MessageManager<string>>('messageManager')?.notify({
//         name: 'minContentWidth', value: '-10vp'
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'minSideBarWidth', value: 200
//       })
//       AppStorage.get<MessageManager<number>>('messageManager')?.notify({
//         name: 'maxSideBarWidth', value: 300
//       })
//       await CommonFunc.sleep(500);
//       console.log("get Initial value")
//       let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
//       let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
//       let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');
//
//       console.log("assert width")
//       expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(200))) <= 1).assertTrue();
//       console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
//       expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(360))) <= 1).assertTrue();
//       console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))
//
//       console.info('[SUB_ACE_SideBarContainerType_1500] END');
//       done();
//     });


  })

}
