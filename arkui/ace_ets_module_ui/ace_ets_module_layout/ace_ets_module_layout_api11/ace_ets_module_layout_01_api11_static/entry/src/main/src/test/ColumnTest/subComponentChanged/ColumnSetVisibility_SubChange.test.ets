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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium';
import router from '@ohos.router';
import {Visibility} from '@ohos.arkui.component'
// import {fp2px,lpx2px} from '@ohos.arkui.UIContext'
import  RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
// import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../../Util.test';
import inspector from '@ohos.arkui.inspector';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function ColumnSetVisibility_SubChange() {
  describe('ColumnSetVisibilityTest', () => {
    beforeAll(async () => {
      console.info("ColumnSetVisibilityTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeAll(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetVisibility_SubChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get ColumnSetVisibility state success " + JSON.stringify(pages));
        if (!("ColumnSetVisibility_SubChange" == pages?.name)) {
          console.info("get ColumnSetVisibility state success " + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options)
        }
      } catch (err) {
        console.error("push ColumnSetVisibility page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(3000);
      console.info("ColumnSetVisibility after each called");
    });

    
    



    /**
     * @tc.number  testColumnSetVisibilityNoneVisible_static
     * @tc.name     testColumnSetVisibilityNoneVisible_static
     * @tc.desc     testColumnSetVisibilityNoneVisible_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSetVisibilityNoneVisible_static', Level.LEVEL0, async () => {
      console.info('new testColumnSetVisibilityNoneVisible_static START');
      try {
        // GlobalContext.getContext().getObject<number>('value').message.notify({
        //   name: 'testVisibility1', value: Visibility.None
        // });
        // GlobalContext.getContext().getObject<number>('value').message.notify({
        //   name: 'testVisibility2', value: Visibility.Visible
        // });
        AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
          name: 'testVisibility1', value: Visibility.None
        });
        AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
          name: 'testVisibility2', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('columnSetVisibility_1');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility_1.bottom - columnSetVisibility_1.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_1.right - columnSetVisibility_1.left) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.top - columnSetVisibility.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_2.bottom - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1)
          .assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(120))) <= 1)
          .assertTrue()

      } catch (err) {
        console.error('[testColumnSetVisibilityNoneVisible_static] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityNoneVisible_static END');
    });

    
    



    /**
     * @tc.number  testColumnSetVisibilityHiddenVisible
     * @tc.name     testColumnSetVisibilityHiddenVisible
     * @tc.desc     testColumnSetVisibilityHiddenVisible
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSetVisibilityHiddenVisible', Level.LEVEL0, async () => {
      console.info('new testColumnSetVisibilityHiddenVisible START');
      try {
        // GlobalContext.getContext().getObject<number>('value').message.notify({
        //   name: 'testVisibility1', value: Visibility.Hidden
        // });
        // GlobalContext.getContext().getObject<number>('value').message.notify({
        //   name: 'testVisibility2', value: Visibility.Visible
        // });
        AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
          name: 'testVisibility1', value: Visibility.Hidden
        });
        AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
          name: 'testVisibility2', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('columnSetVisibility_1');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility.top - columnSetVisibility_1.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.top - columnSetVisibility_1.bottom - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_2.bottom - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1).assertTrue()
      } catch (err) {
        console.error('[testColumnSetVisibilityHiddenVisible] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityHiddenVisible END');
    });

    
    



    /**
     * @tc.number  testColumnSetVisibilityVisible
     * @tc.name     testColumnSetVisibilityVisible
     * @tc.desc     testColumnSetVisibilityVisible
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSetVisibilityVisible', Level.LEVEL0, async () => {
      console.info('new testColumnSetVisibilityVisible START');
      try {
        // GlobalContext.getContext().getObject<number>('value').message.notify({
        //   name: 'testVisibility1', value: Visibility.Visible
        // });
        // GlobalContext.getContext().getObject<number>('value').message.notify({
        //   name: 'testVisibility2', value: Visibility.Visible
        // });
        AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
          name: 'testVisibility1', value: Visibility.Visible
        });
        AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
          name: 'testVisibility2', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('columnSetVisibility_1');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility.top - columnSetVisibility_1.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.top - columnSetVisibility_1.bottom - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_2.bottom - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(40))) <= 1).assertTrue()
      } catch (err) {
        console.error('[testColumnSetVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityVisible END');
    });

    
    



    /**
     * @tc.number  testColumnSetVisibilityVisibleNone_static
     * @tc.name     testColumnSetVisibilityVisibleNone_static
     * @tc.desc     testColumnSetVisibilityVisibleNone_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSetVisibilityVisibleNone_static', Level.LEVEL0, async () => {
      console.info('new testColumnSetVisibilityVisibleNone_static START');
      try {
        // GlobalContext.getContext().getObject<number>('value').message.notify({
        //   name: 'testVisibility1', value: Visibility.Visible
        // });
        // GlobalContext.getContext().getObject<number>('value').message.notify({
        //   name: 'testVisibility2', value: Visibility.None
        // });
        AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
          name: 'testVisibility1', value: Visibility.Visible
        });
        AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
          name: 'testVisibility2', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('columnSetVisibility_2');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility_2.bottom - columnSetVisibility_2.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.right - columnSetVisibility_2.left) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_1.top - columnSetVisibility.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_1.bottom - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(170))) <= 1).assertTrue()
      } catch (err) {
        console.error('[testColumnSetVisibilityVisibleNone_static] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityVisibleNone_static END');
    });
  })
}
