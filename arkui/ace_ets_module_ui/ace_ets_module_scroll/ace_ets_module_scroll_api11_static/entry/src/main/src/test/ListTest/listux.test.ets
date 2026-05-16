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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listUxTest() {

  const SUITE: string = 'listUxTest'

  describe('listUxTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await CommonFunc.sleep(4000);

      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/list_ux",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info('xyb: push ' +pages.name)
        if (!("list_ux" == pages.name)) {
          console.info('xyb: push')
          router.pushUrl(options)
          await CommonFunc.sleep(4000);
        }
      } catch (err: Error) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }

    });

    beforeEach(() => {

    });


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_static_0100
     * @tc.name     ArkUX_Stage_List_Style_static_0100
     * @tc.desc     ArkUX_Stage_List_Style_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          console.log("ArkUX_Stage_List_Style_static_0100 start + json: " +
          JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin'))

          let left = JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('left')

          let right = JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('right')

          console.log("====> ArkUX_Stage_List_Style_static_0100 listItemLeft:" + left + "listItemRight:" + right)
          let listItemHeight = JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_0100"))
            .getElement('$attrs').getElement('size').getString('height')
          console.log("====> ArkUX_Stage_List_Style_static_0100 listItemHeight:" + listItemHeight)
          let listItemGroupLeft =
            JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
              .getElement('$attrs').getString('margin')).getString('left')

          let listItemGroupRight =
            JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
              .getElement('$attrs').getString('margin')).getString('right')

          console.log("====> ArkUX_Stage_List_Style_static_0100 listItemGroupLeft:" + listItemGroupLeft +
            "listItemGroupRight:" + listItemGroupRight)
          expect(listItemGroupLeft).assertEqual(left)
          expect(listItemGroupRight).assertEqual(right)
          expect(parseFloat(listItemHeight)).assertEqual(48);
          expect(listItemHeight.substr(listItemHeight.length - 2, 2)).assertEqual("vp");
        } catch (err: Error) {
          console.info('ArkUX_Stage_List_Style_static_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_static_0200
     * @tc.name     ArkUX_Stage_List_Style_static_0200
     * @tc.desc     ArkUX_Stage_List_Style_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let left =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('left')
        let right =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0200 listItemLeft:" +
        inspector.getInspectorByKey("ListItem_ArkUXII_List_style_0200"))
        let listItemHeight = JSON.parseJsonElement(inspector.getInspectorByKey("ListItem_ArkUXII_List_style_0200"))
          .getElement('$attrs').getElement('size').getString('height')
        console.log("====> ArkUX_Stage_List_Style_static_0200 listItemHeight:" + listItemHeight)
        let listItemGroupLeft =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_0200"))
            .getElement('$attrs').getString('margin')).getString('left')
        let listItemGroupRight =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_0200"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0200 listItemGroupLeft:" + listItemGroupLeft +
          "listItemGroupRight:" + listItemGroupRight)
        expect(listItemGroupLeft).assertEqual(left)
        expect(listItemGroupRight).assertEqual(right)
        expect(parseFloat(listItemHeight)).assertEqual(48);
        expect(listItemHeight.substr(listItemHeight.length - 2, 2)).assertEqual("vp");
      } catch (err: Error) {
        expect().assertFail();
        console.info('ArkUX_Stage_List_Style_static_0200 ERR  ' + JSON.stringify(err));
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_static_0300
     * @tc.name     ArkUX_Stage_List_Style_static_0300
     * @tc.desc     ArkUX_Stage_List_Style_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let left =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('left')
        let right =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0300 listItemLeft:" + left + "listItemRight:" + right)
        let listItemHeight = JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_0300"))
          .getElement('$attrs').getElement('size').getString('height')
        console.log("====> ArkUX_Stage_List_Style_static_0300 listItemHeight:" + listItemHeight)
        let listItemGroupLeft =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
            .getElement('$attrs').getString('margin')).getString('left')
        let listItemGroupRight =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0300 listItemGroupLeft:" + listItemGroupLeft +
          "listItemGroupRight:" + listItemGroupRight)
        expect(listItemGroupLeft).assertEqual(left)
        expect(listItemGroupRight).assertEqual(right)
        expect(parseFloat(listItemHeight) == 48).assertFalse();
      } catch (err: Error) {
        console.info('ArkUX_Stage_List_Style_static_0300 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_static_0400
     * @tc.name     ArkUX_Stage_List_Style_static_0400
     * @tc.desc     ArkUX_Stage_List_Style_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let left =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('left')
        let right =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0400 listItemLeft:" + left + "listItemRight:" + right)
        let listItemHeight = JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_0400"))
          .getElement('$attrs').getElement('size').getString('height')
        console.log("====> ArkUX_Stage_List_Style_static_0400 listItemHeight:" + listItemHeight)
        let listItemGroupLeft =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
            .getElement('$attrs').getString('margin')).getString('left')
        let listItemGroupRight =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0400 listItemGroupLeft:" + listItemGroupLeft +
          "listItemGroupRight:" + listItemGroupRight)
        expect(listItemGroupLeft).assertEqual(left)
        expect(listItemGroupRight).assertEqual(right)
        expect(parseFloat(listItemHeight) == 48).assertFalse();
      } catch (err: Error) {
        console.info('ArkUX_Stage_List_Style_static_0400 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_static_0500
     * @tc.name     ArkUX_Stage_List_Style_static_0500
     * @tc.desc     ArkUX_Stage_List_Style_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let left =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('left')
        let right =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0500 listItemLeft:" + left + "listItemRight:" + right)
        let listItemHeight = JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_0500"))
          .getElement('$attrs').getElement('size').getString('height')
        console.log("====> ArkUX_Stage_List_Style_static_0500 listItemHeight:" + listItemHeight)
        let listItemGroupLeft =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
            .getElement('$attrs').getString('margin')).getString('left')
        let listItemGroupRight =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0500 listItemGroupLeft:" + listItemGroupLeft +
          "listItemGroupRight:" + listItemGroupRight)
        expect(listItemGroupLeft).assertEqual(left)
        expect(listItemGroupRight).assertEqual(right)
        expect(parseFloat(listItemHeight) == 48).assertFalse();
      } catch (err: Error) {
        console.info('ArkUX_Stage_List_Style_static_0500 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_static_0600
     * @tc.name     ArkUX_Stage_List_Style_static_0600
     * @tc.desc     ArkUX_Stage_List_Style_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let left =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('left')
        let right =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0600 listItemLeft:" + left + "listItemRight:" + right)
        let listItemHeight = JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_0600"))
          .getElement('$attrs').getElement('size').getString('height')
        console.log("====> ArkUX_Stage_List_Style_static_0600 listItemHeight:" + listItemHeight)
        let listItemGroupLeft =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
            .getElement('$attrs').getString('margin')).getString('left')
        let listItemGroupRight =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0600 listItemGroupLeft:" + listItemGroupLeft +
          "listItemGroupRight:" + listItemGroupRight)
        expect(listItemGroupLeft).assertEqual(left)
        expect(listItemGroupRight).assertEqual(right)
        expect(parseFloat(listItemHeight) == 48).assertFalse();
      } catch (err: Error) {
        console.info('ArkUX_Stage_List_Style_static_0600 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_static_0700
     * @tc.name     ArkUX_Stage_List_Style_static_0700
     * @tc.desc     ArkUX_Stage_List_Style_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let left =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('left')
        let right =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0700 listItemLeft:" + left + "listItemRight:" + right)
        let listItemHeight = JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_0700"))
          .getElement('$attrs').getElement('size').getString('height')
        console.log("====> ArkUX_Stage_List_Style_static_0700 listItemHeight:" + listItemHeight)
        let listItemGroupLeft =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
            .getElement('$attrs').getString('margin')).getString('left')
        let listItemGroupRight =
          JSON.parseJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey("ListItemGroup"))
            .getElement('$attrs').getString('margin')).getString('right')
        console.log("====> ArkUX_Stage_List_Style_static_0700 listItemGroupLeft:" + listItemGroupLeft +
          "listItemGroupRight:" + listItemGroupRight)
        expect(listItemGroupLeft).assertEqual(left)
        expect(listItemGroupRight).assertEqual(right)
        expect(parseFloat(listItemHeight) == 48).assertFalse();
      } catch (err: Error) {
        console.info('ArkUX_Stage_List_Style_static_0700 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_static_0800
     * @tc.name     ArkUX_Stage_List_Style_static_0800
     * @tc.desc     ArkUX_Stage_List_Style_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let margin = JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
          .getElement('$attrs').getString('margin')
        console.log("====> ArkUX_Stage_List_Style_static_0800 margin:" + margin)
        let listItemGroupMargin =
          JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_0800"))
            .getElement('$attrs').getString('margin')
        console.log("====> ArkUX_Stage_List_Style_static_0800 listItemGroupMargin:" + listItemGroupMargin)
        expect(listItemGroupMargin == margin).assertFalse()
      } catch (err: Error) {
        console.info('ArkUX_Stage_List_Style_static_0800 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_static_0900
     * @tc.name     ArkUX_Stage_List_Style_static_0900
     * @tc.desc     ArkUX_Stage_List_Style_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let margin = JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
          .getElement('$attrs').getString('margin')
        console.log("====> ArkUX_Stage_List_Style_static_0900 margin:" + margin)
        let listItemGroupMargint =
          JSON.stringify(JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_0900"))
            .getElement('$attrs').getElement('margin'))
        console.log("====> ArkUX_Stage_List_Style_static_0900 listItemGroupMargint:" + listItemGroupMargint)
        expect(listItemGroupMargint == margin).assertFalse()
      } catch (err: Error) {
        console.info('ArkUX_Stage_List_Style_static_0900 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_1000
     * @tc.name     ArkUX_Stage_List_Style_1000
     * @tc.desc     ArkUX_Stage_List_Style_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let margin = JSON.stringify(JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
          .getElement('$attrs')
          .getString('margin'))
        console.log("====> ArkUX_Stage_List_Style_1000 margin:" + margin)
        let listItemGroupMargin =
          JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_1000"))
            .getElement('$attrs').getString('margin')
        console.log("====> ArkUX_Stage_List_Style_1000 listItemGroupMargin:" + listItemGroupMargin)
        expect(listItemGroupMargin == margin).assertFalse()
      } catch (err: Error) {
        console.info('ArkUX_Stage_List_Style_1000 ERR' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_1100
     * @tc.name     ArkUX_Stage_List_Style_1100
     * @tc.desc     ArkUX_Stage_List_Style_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let margin = JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
          .getElement('$attrs')
          .getString('margin')
        console.log("====> ArkUX_Stage_List_Style_1100 margin:" + margin)
        let listItemGroupMargin =
          JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_1100"))
            .getElement('$attrs').getString('margin')
        console.log("====> ArkUX_Stage_List_Style_1100 listItemGroupMargin:" + listItemGroupMargin)
        expect(listItemGroupMargin == margin).assertFalse()
      } catch (err: Error) {
        console.info('ArkUX_Stage_List_Style_1100 ERR' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_Style_1200
     * @tc.name     ArkUX_Stage_List_Style_1200
     * @tc.desc     ArkUX_Stage_List_Style_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_Style_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let margin = JSON.parseJsonElement(inspector.getInspectorByKey("nurmal"))
          .getElement('$attrs')
          .getString('margin')
        console.log("====> ArkUX_Stage_List_Style_1200 margin:" + margin)
        let listItemGroupMargin = JSON.parseJsonElement(inspector.getInspectorByKey("ArkUXII_List_style_1200"))
            .getElement('$attrs').getString('margin')
        console.log("====> ArkUX_Stage_List_Style_1200 listItemGroupMargin:" + listItemGroupMargin)
        expect(listItemGroupMargin == margin).assertFalse()
      } catch (err: Error) {
        console.info('ArkUX_Stage_List_Style_1200 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_RollBack_0100
     * @tc.name     ArkUX_Stage_List_RollBack_0100
     * @tc.desc     ArkUX_Stage_List_RollBack_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_RollBack_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        inspector.sendEventByKey("scrollerForList", 10, "")
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey("RollBack"))
          .getElement('$attrs')
          .tryGetElement('scrollerForList')
        expect(obj === undefined).assertTrue()
      } catch (err: Error) {
        console.info('ArkUX_Stage_List_RollBack_0100 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_0100
     * @tc.name     ArkUX_Stage_List_LimitAnimation_0100
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_0100"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_0100 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE")
        } catch (err: Error) {
          expect().assertFail();
          console.log('ArkUX_Stage_List_LimitAnimation_0100 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_0200
     * @tc.name     ArkUX_Stage_List_LimitAnimation_0200
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_0200"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_0200 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.START")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_0200 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_0300
     * @tc.name     ArkUX_Stage_List_LimitAnimation_0300
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_0300"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_0300 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.CENTER")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_0300 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_0400
     * @tc.name     ArkUX_Stage_List_LimitAnimation_0400
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_0400"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_0400 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.END")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_0400 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_0500
     * @tc.name     ArkUX_Stage_List_LimitAnimation_0500
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_0500"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_0500 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_0500 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_0600
     * @tc.name     ArkUX_Stage_List_LimitAnimation_0600
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_0600"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_0600 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_0600 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_0700
     * @tc.name     ArkUX_Stage_List_LimitAnimation_0700
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_0700"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_0700 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_0700 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_0800
     * @tc.name     ArkUX_Stage_List_LimitAnimation_0800
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_0800"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_0800 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_0800 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_0900
     * @tc.name     ArkUX_Stage_List_LimitAnimation_0900
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_0900"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_0900 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_0900 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_static_1000
     * @tc.name     ArkUX_Stage_List_LimitAnimation_static_1000
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_1000"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_static_1000 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_static_1000 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_static_1100
     * @tc.name     ArkUX_Stage_List_LimitAnimation_static_1100
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_1100"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_static_1100 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.START")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_static_1100 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_static_1200
     * @tc.name     ArkUX_Stage_List_LimitAnimation_static_1200
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_1200"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_static_1200 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.START")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_static_1200 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_static_1300
     * @tc.name     ArkUX_Stage_List_LimitAnimation_static_1300
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_1300"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_static_1300 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.START")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_static_1300 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_static_1400
     * @tc.name     ArkUX_Stage_List_LimitAnimation_static_1400
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_1400"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_static_1400 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_static_1400 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_static_1500
     * @tc.name     ArkUX_Stage_List_LimitAnimation_static_1500
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_static_1500
     * @tc.level    Level.LEVEL0
     */
//it('ArkUX_Stage_List_LimitAnimation_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   setTimeout(() => {
    //     try {
    //       let scrollSnapAlign =
    //         JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_1500"))
    //           .getElement('$attrs').getString('scrollSnapAlign')
    //       console.log("====> ArkUX_Stage_List_LimitAnimation_static_1500 listItemLeft:" + scrollSnapAlign)
    //       expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.START")
    //     } catch (err: Error) {
    //       expect().assertFail();
    //       console.info('ArkUX_Stage_List_LimitAnimation_static_1500 ERR  ' + JSON.stringify(err));
    //     }
    //     done()
    //   }, 500);
    // })


    
    /**
     * @tc.number   ArkUX_Stage_List_LimitAnimation_static_1600
     * @tc.name     ArkUX_Stage_List_LimitAnimation_static_1600
     * @tc.desc     ArkUX_Stage_List_LimitAnimation_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_List_LimitAnimation_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      setTimeout(() => {
        try {
          console.log('xyb: 111' + inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_1600"))
          let scrollSnapAlign =
            JSON.parseJsonElement(inspector.getInspectorByKey("ArkUX_Stage_List_LimitAnimation_1600"))
              .getElement('$attrs').getString('scrollSnapAlign')
          console.log("====> ArkUX_Stage_List_LimitAnimation_static_1600 listItemLeft:" + scrollSnapAlign)
          expect(scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE")
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_LimitAnimation_static_1600 ERR  ' + JSON.stringify(err));
        }
        done()
      }, 500);
    })

  })
}
