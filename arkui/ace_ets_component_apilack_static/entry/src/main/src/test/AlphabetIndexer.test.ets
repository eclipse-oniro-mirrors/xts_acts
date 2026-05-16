'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { Color, $r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';


let domain: number = 0x0000;
let tag: string = 'testTag';

export default function alphabetIndexerOnSelectJsunit() {
  describe('alphabetIndexerOnSelectTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/alphabetIndexer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get alphabetIndexer state success " + JSON.stringify(pages));
        if (!("alphabetIndexer" == pages.name)) {
          console.info("get alphabetIndexer state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push alphabetIndexer page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("alphabetIndexerOnSelect after each called");
    });

    
    
    
    /**
     * @tc.number   testalphabetIndexerWidth_static_0001
     * @tc.name     testalphabetIndexerWidth_static_0001
     * @tc.desc     testalphabetIndexerWidth_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerWidth_static_0001', Level.LEVEL0, async () => {
      console.info('alphabetIndexerWidth testalphabetIndexerWidth0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerWidth0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testalphabetIndexerWidth0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testalphabetIndexerHeight_static_0002
     * @tc.name     testalphabetIndexerHeight_static_0002
     * @tc.desc     testalphabetIndexerHeight_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerHeight_static_0002', Level.LEVEL0, async () => {
      console.info('alphabetIndexerHeight testalphabetIndexerHeight0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerHeight0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("300.00vp");
      console.info("[testalphabetIndexerHeight0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testalphabetIndexerColor_static_0003
     * @tc.name     testalphabetIndexerColor_static_0003
     * @tc.desc     testalphabetIndexerColor_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerColor_static_0003', Level.LEVEL0, async () => {
      console.info('alphabetIndexerColor testalphabetIndexerColor0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerColor0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(obj.getElement('$attrs').getString('color')).assertEqual('#FFFF0000');
      console.info("[testalphabetIndexerColor0003] color value :" + obj.getElement('$attrs').getString('color'));

    });

    
    
    
    /**
     * @tc.number   testalphabetIndexerSelectedColor_static_0004
     * @tc.name     testalphabetIndexerSelectedColor_static_0004
     * @tc.desc     testalphabetIndexerSelectedColor_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerSelectedColor_static_0004', Level.LEVEL0, async () => {
      console.info('alphabetIndexerSelectedColor testalphabetIndexerSelectedColor0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerOnSelect0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual("#FFFFFFFF");
      console.info("[testalphabetIndexerSelectedColor0004] selectedColor value :" +
      obj.getElement('$attrs').getString('selectedColor'));
    });

    
    
    
    /**
     * @tc.number   testalphabetIndexerPopupColor_static_0005
     * @tc.name     testalphabetIndexerPopupColor_static_0005
     * @tc.desc     testalphabetIndexerPopupColor_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerPopupColor_static_0005', Level.LEVEL0, async () => {
      console.info('alphabetIndexerPopupColor testalphabetIndexerPopupColor0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerPopupColor0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(obj.getElement('$attrs').getString('popupColor')).assertEqual("#FF48D1CC");
      console.info("[testalphabetIndexerPopupColor0005] popupColor value :" +
      obj.getElement('$attrs').getString('popupColor'));

    });

    
    
    
    /**
     * @tc.number   testalphabetIndexerSelectedBackgroundColor_static_0006
     * @tc.name     testalphabetIndexerSelectedBackgroundColor_static_0006
     * @tc.desc     testalphabetIndexerSelectedBackgroundColor_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerSelectedBackgroundColor_static_0006', Level.LEVEL0, async () => {
      console.info('alphabetIndexerSelectedBackgroundColor testalphabetIndexerSelectedBackgroundColor0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerSelectedBackgroundColor0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual("#FF0000E6");
      console.info("[testalphabetIndexerSelectedBackgroundColor0006] selectedBackgroundColor value :" +
      obj.getElement('$attrs').getString('selectedBackgroundColor'));
    });

    
    
    
    /**
     * @tc.number   testalphabetIndexerPopupBackground_static_0007
     * @tc.name     testalphabetIndexerPopupBackground_static_0007
     * @tc.desc     testalphabetIndexerPopupBackground_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerPopupBackground_static_0007', Level.LEVEL0, async () => {
      console.info('alphabetIndexerPopupBackground testalphabetIndexerPopupBackground0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerPopupBackground0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(obj.getElement('$attrs').getString('popupBackground')).assertEqual("#FF00DDDD");
      console.info("[testalphabetIndexerPopupBackground0007] popupBackground value :" +
      obj.getElement('$attrs').getString('popupBackground'));
    });

    
    
    
    /**
     * @tc.number   testalphabetIndexerUsingPopup_static_0009
     * @tc.name     testalphabetIndexerUsingPopup_static_0009
     * @tc.desc     testalphabetIndexerUsingPopup_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerUsingPopup_static_0009', Level.LEVEL0, async () => {
      console.info('alphabetIndexerUsingPopup testalphabetIndexerUsingPopup009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerUsingPopup0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(obj.getElement('$attrs').getString('usingPopup')).assertEqual('true');
      console.info("[testalphabetIndexerUsingPopup0009] usingPopup value :" +
      obj.getElement('$attrs').getString('usingPopup'));

    });

    
    
    
    /**
     * @tc.number   testalphabetIndexerItemSize_static_0010
     * @tc.name     testalphabetIndexerItemSize_static_0010
     * @tc.desc     testalphabetIndexerItemSize_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerItemSize_static_0010', Level.LEVEL0, async () => {
      console.info('alphabetIndexerItemSize testalphabetIndexerItemSize0010 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerItemSize0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(obj.getElement('$attrs').getString('itemSize')).assertEqual("28.00vp");
      console.info("[testalphabetIndexerItemSize0010] itemSize value :" +
      obj.getElement('$attrs').getString('itemSize'));

    });

    
    
    
    /**
     * @tc.number   testalphabetIndexerAlignStyle_static_0011
     * @tc.name     testalphabetIndexerAlignStyle_static_0011
     * @tc.desc     testalphabetIndexerAlignStyle_static_0011
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerAlignStyle_static_0011', Level.LEVEL0, async () => {
      console.info('alphabetIndexerAlignStyle testalphabetIndexerAlignStyle0011 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      console.info("[testalphabetIndexerAlignStyle0011] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      expect(obj.getElement('$attrs').getString('alignStyle')).assertEqual("IndexerAlign.Left");
      console.info("[testalphabetIndexerItemSize0010] alignStyle value :" +
      obj.getElement('$attrs').getString('alignStyle'));

    });

    
    
    
    /**
     * @tc.number   testalphabetIndexerOnSelect_static_0012
     * @tc.name     testalphabetIndexerOnSelect_static_0012
     * @tc.desc     testalphabetIndexerOnSelect_static_0012
     * @tc.level    Level.LEVEL0
     */
it('testalphabetIndexerOnSelect_static_0012', Level.LEVEL0, async () => {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0011 START');
      await Utils.sleep(2000);
      inspector.sendEventByKey('alphabetIndexer', 10, "")
      await Utils.sleep(2000);
      expect(AppStorage.get<boolean>('onRequestPopupDataStatus')).assertTrue();
      await Utils.sleep(2000);
      console.info("onSelect_0012 click result is: " + JSON.stringify(inspector.sendEventByKey('alphabetIndexer',
        10, "")));
      await Utils.sleep(2000);
      expect(AppStorage.get<boolean>('onSelectStatus')).assertTrue();
      console.info('testalphabetIndexerOnSelect0012 END');
    });
  })
}
