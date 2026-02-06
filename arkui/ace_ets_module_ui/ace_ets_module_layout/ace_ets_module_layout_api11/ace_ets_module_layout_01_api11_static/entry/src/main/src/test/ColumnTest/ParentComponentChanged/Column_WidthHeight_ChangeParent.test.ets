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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { GlobalContext } from '../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { UIContext } from "@ohos.arkui.UIContext";
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function column_WidthHeight_ChangeParent() {

  describe('Column_WidthHeight_ChangeParentTest', () => {
    beforeAll(() => {
      console.info("Column_WidthHeight_ChangeParentTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Column_WidthHeight_ChangeParentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ParentComponentChanged/Column_WidthHeight_ChangeParent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Column_WidthHeight_ChangeParentTest state pages:" + JSON.stringify(pages));
        if (!("Column_WidthHeight_ChangeParent" == pages.name)) {
          console.info("get Column_WidthHeight_ChangeParentTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Column_WidthHeight_ChangeParentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_WidthHeight_ChangeParentTest page error:" + err);
      }
      console.info("Column_WidthHeight_ChangeParentTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Column_WidthHeight_ChangeParent afterEach called");
    });


    /**
     * @tc.number  testColumnWidthHeightChangeParentHeightInRange_static
     * @tc.name     testColumnWidthHeightChangeParentHeightInRange_static
     * @tc.desc     testColumnWidthHeightChangeParentHeightInRange_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnWidthHeightChangeParentHeightInRange_static', Level.LEVEL0, async () => {
      console.info('new testColumnWidthHeightChangeParentHeightInRange_static START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({ name: 'height', value: 400 })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({ name: 'width', value: 350 })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnWidthHeightChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1: RectValue = CommonFunc.getComponentRect('WidthHeight_Test1');
      let locationText2: RectValue = CommonFunc.getComponentRect('WidthHeight_Test2');
      let locationText3: RectValue = CommonFunc.getComponentRect('WidthHeight_Test3');
      let locationColumn: RectValue = CommonFunc.getComponentRect('ColumnWidthHeightChange1');
      expect(Math.abs((Math.round((locationText1.left - locationColumn.left) * 10) / 10) -
        (Math.round(uiContext!.vp2px(25) * 10) / 10)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationColumn.left)) -
        (Math.round(locationColumn.right - locationText1.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.left - locationColumn.left)) -
        (Math.round(locationColumn.right - locationText2.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.left - locationColumn.left)) -
        (Math.round(locationColumn.right - locationText3.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round((locationColumn.right - locationText1.right) * 10) / 10) -
        (Math.round(uiContext!.vp2px(25) * 10) / 10)) <= 1).assertTrue();
      expect(Math.abs((locationText1.top) - (locationColumn.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.bottom - locationText3.bottom)) -
        (Math.round(uiContext!.vp2px(40)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) -
        (Math.round(locationText3.top - locationText2.bottom))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(uiContext!.vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(uiContext!.vp2px(300)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(uiContext!.vp2px(300)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(uiContext!.vp2px(300)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(uiContext!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(uiContext!.vp2px(100)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(uiContext!.vp2px(150)))) <=
        1).assertTrue();
      console.info('new testColumnWidthHeightChangeParentHeightInRange_static END');
    });


    /**
     * @tc.number  testColumnWidthHeightChangeParentHeightOutRange_static
     * @tc.name     testColumnWidthHeightChangeParentHeightOutRange_static
     * @tc.desc     testColumnWidthHeightChangeParentHeightOutRange_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnWidthHeightChangeParentHeightOutRange_static', Level.LEVEL0, async () => {
      console.info('new testColumnWidthHeightChangeParentHeightOutRange START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({ name: 'height', value: 300 })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({ name: 'width', value: 350 })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnWidthHeightChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1: RectValue = CommonFunc.getComponentRect('WidthHeight_Test1');
      let locationText2: RectValue = CommonFunc.getComponentRect('WidthHeight_Test2');
      let locationText3: RectValue = CommonFunc.getComponentRect('WidthHeight_Test3');
      let locationColumn: RectValue = CommonFunc.getComponentRect('ColumnWidthHeightChange1');
      expect(Math.abs((Math.round((locationText1.left - locationColumn.left) * 10) / 10) -
        (Math.round(uiContext!.vp2px(25) * 10) / 10)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationColumn.left)) -
        (Math.round(locationColumn.right - locationText1.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.left - locationColumn.left)) -
        (Math.round(locationColumn.right - locationText2.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.left - locationColumn.left)) -
        (Math.round(locationColumn.right - locationText3.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round((locationColumn.right - locationText1.right) * 10) / 10) -
        (Math.round(uiContext!.vp2px(25) * 10) / 10)) <= 1).assertTrue();
      expect(Math.abs((locationText1.top) - (locationColumn.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationColumn.bottom)) -
        (Math.round(uiContext!.vp2px(60)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) -
        (Math.round(locationText3.top - locationText2.bottom))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(uiContext!.vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(uiContext!.vp2px(300)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(uiContext!.vp2px(300)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(uiContext!.vp2px(300)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(uiContext!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(uiContext!.vp2px(100)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(uiContext!.vp2px(150)))) <=
        1).assertTrue();
      console.info('new testColumnWidthHeightChangeParentHeightOutRange END');
    });


    /**
     * @tc.number  testColumnWidthHeightChangeParentWidthOutRange_static
     * @tc.name     testColumnWidthHeightChangeParentWidthOutRange_static
     * @tc.desc     testColumnWidthHeightChangeParentWidthOutRange_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnWidthHeightChangeParentWidthOutRange_static', Level.LEVEL0, async () => {
      console.info('new testColumnWidthHeightChangeParentWidthOutRange START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({ name: 'height', value: 400 })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({ name: 'width', value: 200 })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnWidthHeightChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1: RectValue = CommonFunc.getComponentRect('WidthHeight_Test1');
      let locationText2: RectValue = CommonFunc.getComponentRect('WidthHeight_Test2');
      let locationText3: RectValue = CommonFunc.getComponentRect('WidthHeight_Test3');
      let locationColumn: RectValue = CommonFunc.getComponentRect('ColumnWidthHeightChange1');
      expect(Math.abs((Math.round(locationColumn.left - locationText1.left)) - (Math.round(uiContext!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationColumn.left - locationText1.left)) -
        (Math.round(locationText1.right - locationColumn.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.left - locationText2.left)) -
        (Math.round(locationText2.right - locationColumn.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.left - locationText3.left)) -
        (Math.round(locationText3.right - locationColumn.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationColumn.right)) - (Math.round(uiContext!.vp2px(50)))) <=
        1).assertTrue();
      expect(Math.abs((locationText1.top) - (locationColumn.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.bottom - locationText3.bottom)) -
        (Math.round(uiContext!.vp2px(40)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) -
        (Math.round(locationText3.top - locationText2.bottom))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(uiContext!.vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(uiContext!.vp2px(300)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(uiContext!.vp2px(300)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(uiContext!.vp2px(300)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(uiContext!.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(uiContext!.vp2px(100)))) <=
        1).assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(uiContext!.vp2px(150)))) <=
        1).assertTrue();
      console.info('new testColumnWidthHeightChangeParentWidthOutRange END');
    });
  })
}