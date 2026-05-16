/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function NavigationAttributeNullUndefinedTest() {
  describe('NavigationAttributeNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('NavigationAttributeNullUndefined beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationAttributeNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get NavigationAttributeNullUndefined state pages:' + JSON.stringify(pages));
        if (!('NavigationAttributeNullUndefined' == pages.name)) {
          console.info('get NavigationAttributeNullUndefined pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push NavigationAttributeNullUndefined page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push NavigationAttributeNullUndefined page error:' + err);
      }
      console.info('NavigationAttributeNullUndefined beforeEach end');
      done();
    });

    /**
     * @tc.name   navigationNavBarWidth_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_NAVBARWIDTH_NULL_0100
     * @tc.desc   Test Navigation navBarWidth property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationNavBarWidth_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationNavBarWidth_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_navBarWidth_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_navBarWidth_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationNavBarWidth_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationNavBarWidth_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value (240)
        expect(obj.$attrs.navBarWidth).assertEqual(objCompare.$attrs.navBarWidth);
        console.info('[navigationNavBarWidth_null_0100] Navigation navBarWidth with null restores to default');
      } catch (error) {
        console.info('[navigationNavBarWidth_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationNavBarWidth_null_0100] END');
    })

    /**
     * @tc.name   navigationNavBarWidth_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_NAVBARWIDTH_UNDEFINED_0100
     * @tc.desc   Test Navigation navBarWidth property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationNavBarWidth_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationNavBarWidth_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_navBarWidth_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_navBarWidth_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationNavBarWidth_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationNavBarWidth_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should keep value as is (default: 240)
        expect(obj.$attrs.navBarWidth).assertEqual(objCompare.$attrs.navBarWidth);
        console.info('[navigationNavBarWidth_undefined_0100] Navigation navBarWidth with undefined keeps default');
      } catch (error) {
        console.info('[navigationNavBarWidth_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationNavBarWidth_undefined_0100] END');
    })

    /**
     * @tc.name   navigationMinContentWidth_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_MINCONTENTWIDTH_NULL_0100
     * @tc.desc   Test Navigation minContentWidth property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationMinContentWidth_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationMinContentWidth_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_minContentWidth_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_minContentWidth_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationMinContentWidth_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationMinContentWidth_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value (360)
        expect(obj.$attrs.minContentWidth).assertEqual(objCompare.$attrs.minContentWidth);
        console.info('[navigationMinContentWidth_null_0100] Navigation minContentWidth with null restores to default');
      } catch (error) {
        console.info('[navigationMinContentWidth_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationMinContentWidth_null_0100] END');
    })

    /**
     * @tc.name   navigationMinContentWidth_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_MINCONTENTWIDTH_UNDEFINED_0100
     * @tc.desc   Test Navigation minContentWidth property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationMinContentWidth_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationMinContentWidth_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_minContentWidth_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_minContentWidth_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationMinContentWidth_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationMinContentWidth_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should keep value as is (default: 360)
        expect(obj.$attrs.minContentWidth).assertEqual(objCompare.$attrs.minContentWidth);
      } catch (error) {
        console.info('[navigationMinContentWidth_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationMinContentWidth_undefined_0100] END');
    })

    /**
     * @tc.name   navigationMenus_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_MENUS_NULL_0100
     * @tc.desc   Test Navigation menus property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationMenus_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationMenus_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_menus_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_menus_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationMenus_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationMenus_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should clear menus or restore to default (no menus)
        expect(obj.$attrs.menus).assertEqual(objCompare.$attrs.menus);
        console.info('[navigationMenus_null_0100] Navigation menus with null restores to default');
      } catch (error) {
        console.info('[navigationMenus_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationMenus_null_0100] END');
    })

    /**
     * @tc.name   navigationMenus_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_MENUS_UNDEFINED_0100
     * @tc.desc   Test Navigation menus property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationMenus_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationMenus_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_menus_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_menus_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationMenus_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationMenus_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should clear menus or restore to default (no menus)
        expect(obj.$attrs.menus).assertEqual(objCompare.$attrs.menus);
        console.info('[navigationMenus_undefined_0100] Navigation menus with undefined restores to default');
      } catch (error) {
        console.info('[navigationMenus_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationMenus_undefined_0100] END');
    })

    /**
     * @tc.name   navigationToolBar_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_TOOLBAR_NULL_0100
     * @tc.desc   Test Navigation toolBar property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationToolBar_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationToolBar_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_toolBar_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_toolBar_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationToolBar_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationToolBar_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should clear toolbar or restore to default (no toolbar)
        expect(obj.$attrs.toolBar).assertEqual(objCompare.$attrs.toolBar);
        console.info('[navigationToolBar_null_0100] Navigation toolBar with null restores to default');
      } catch (error) {
        console.info('[navigationToolBar_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationToolBar_null_0100] END');
    })

    /**
     * @tc.name   navigationToolBar_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_TOOLBAR_UNDEFINED_0100
     * @tc.desc   Test Navigation toolBar property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationToolBar_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationToolBar_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_toolBar_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_toolBar_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationToolBar_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationToolBar_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should clear toolbar or restore to default (no toolbar)
        expect(obj.$attrs.toolBar).assertEqual(objCompare.$attrs.toolBar);
        console.info('[navigationToolBar_undefined_0100] Navigation toolBar with undefined restores to default');
      } catch (error) {
        console.info('[navigationToolBar_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationToolBar_undefined_0100] END');
    })

    /**
     * @tc.name   navigationEnableToolBarAdaptation_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_ENABLETOOLBARADAPTATION_NULL_0100
     * @tc.desc   Test Navigation enableToolBarAdaptation property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationEnableToolBarAdaptation_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationEnableToolBarAdaptation_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_enableToolBarAdaptation_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_enableToolBarAdaptation_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationEnableToolBarAdaptation_null_0100] default obj is: "
          + JSON.stringify(objCompare.$attrs));
        console.info("[navigationEnableToolBarAdaptation_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value (true)
        expect(obj.$attrs.enableToolBarAdaptation).assertEqual(objCompare.$attrs.enableToolBarAdaptation);
      } catch (error) {
        console.info('[navigationEnableToolBarAdaptation_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationEnableToolBarAdaptation_null_0100] END');
    })

    /**
     * @tc.name   navigationEnableToolBarAdaptation_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_ENABLETOOLBARADAPTATION_UNDEFINED_0100
     * @tc.desc   Test Navigation enableToolBarAdaptation property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationEnableToolBarAdaptation_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationEnableToolBarAdaptation_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_enableToolBarAdaptation_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_enableToolBarAdaptation_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationEnableToolBarAdaptation_undefined_0100] default obj is: "
          + JSON.stringify(objCompare.$attrs));
        console.info("[navigationEnableToolBarAdaptation_undefined_0100] undefined obj is: "
          + JSON.stringify(obj.$attrs));

        // undefined should keep value as is (default: true)
        expect(obj.$attrs.enableToolBarAdaptation).assertEqual(objCompare.$attrs.enableToolBarAdaptation);
      } catch (error) {
        console.info('[navigationEnableToolBarAdaptation_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationEnableToolBarAdaptation_undefined_0100] END');
    })

    /**
     * @tc.name   navigationSystemBarStyle_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_SYSTEMBARSTYLE_NULL_0100
     * @tc.desc   Test Navigation systemBarStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationSystemBarStyle_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationSystemBarStyle_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_systemBarStyle_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_systemBarStyle_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationSystemBarStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationSystemBarStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value (null or no style)
        expect(obj.$attrs.systemBarStyle).assertEqual(objCompare.$attrs.systemBarStyle);
        console.info('[navigationSystemBarStyle_null_0100] Navigation systemBarStyle with null restores to default');
      } catch (error) {
        console.info('[navigationSystemBarStyle_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationSystemBarStyle_null_0100] END');
    })

    /**
     * @tc.name   navigationSystemBarStyle_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_SYSTEMBARSTYLE_UNDEFINED_0100
     * @tc.desc   Test Navigation systemBarStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationSystemBarStyle_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationSystemBarStyle_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_systemBarStyle_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_systemBarStyle_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationSystemBarStyle_undefined_0100] default obj is: "
          + JSON.stringify(objCompare.$attrs));
        console.info("[navigationSystemBarStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should keep value as is (default: null or no style)
        expect(obj.$attrs.systemBarStyle).assertEqual(objCompare.$attrs.systemBarStyle);
      } catch (error) {
        console.info('[navigationSystemBarStyle_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationSystemBarStyle_undefined_0100] END');
    })

    /**
     * @tc.name   navigationEnableDragBar_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_ENABLEDRAGBAR_NULL_0100
     * @tc.desc   Test Navigation enableDragBar property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationEnableDragBar_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationEnableDragBar_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_enableDragBar_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_enableDragBar_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationEnableDragBar_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationEnableDragBar_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value (false)
        expect(obj.$attrs.enableDragBar).assertEqual(objCompare.$attrs.enableDragBar);
        console.info('[navigationEnableDragBar_null_0100] Navigation enableDragBar with null restores to default');
      } catch (error) {
        console.info('[navigationEnableDragBar_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationEnableDragBar_null_0100] END');
    })

    /**
     * @tc.name   navigationEnableDragBar_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_ENABLEDRAGBAR_UNDEFINED_0100
     * @tc.desc   Test Navigation enableDragBar property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationEnableDragBar_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationEnableDragBar_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_enableDragBar_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_enableDragBar_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationEnableDragBar_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationEnableDragBar_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should keep value as is (default: false)
        expect(obj.$attrs.enableDragBar).assertEqual(objCompare.$attrs.enableDragBar);
        console.info('[navigationEnableDragBar_undefined_0100] Navigation enableDragBar with undefined keeps default');
      } catch (error) {
        console.info('[navigationEnableDragBar_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationEnableDragBar_undefined_0100] END');
    })

    /**
     * @tc.name   navigationEnableModeChangeAnimation_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_ENABLEMODECHANGEANIMATION_NULL_0100
     * @tc.desc   Test Navigation enableModeChangeAnimation property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationEnableModeChangeAnimation_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationEnableModeChangeAnimation_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_enableModeChangeAnimation_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_enableModeChangeAnimation_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationEnableModeChangeAnimation_null_0100] default obj is: "
          + JSON.stringify(objCompare.$attrs));
        console.info("[navigationEnableModeChangeAnimation_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value (true)
        expect(obj.$attrs.enableModeChangeAnimation).assertEqual(objCompare.$attrs.enableModeChangeAnimation);
      } catch (error) {
        console.info('[navigationEnableModeChangeAnimation_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationEnableModeChangeAnimation_null_0100] END');
    })

    /**
     * @tc.name   navigationEnableModeChangeAnimation_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_ENABLEMODECHANGEANIMATION_UNDEFINED_0100
     * @tc.desc   Test Navigation enableModeChangeAnimation property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationEnableModeChangeAnimation_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationEnableModeChangeAnimation_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_enableModeChangeAnimation_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_enableModeChangeAnimation_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationEnableModeChangeAnimation_undefined_0100] default obj is: "
          + JSON.stringify(objCompare.$attrs));
        console.info("[navigationEnableModeChangeAnimation_undefined_0100] undefined obj is: "
          + JSON.stringify(obj.$attrs));

        // undefined should keep value as is (default: true)
        expect(obj.$attrs.enableModeChangeAnimation).assertEqual(objCompare.$attrs.enableModeChangeAnimation);
      } catch (error) {
        console.info('[navigationEnableModeChangeAnimation_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationEnableModeChangeAnimation_undefined_0100] END');
    })

    /**
     * @tc.name   navigationSplitPlaceholder_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_SPLITPLACEHOLDER_NULL_0100
     * @tc.desc   Test Navigation splitPlaceholder property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationSplitPlaceholder_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationSplitPlaceholder_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_splitPlaceholder_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_splitPlaceholder_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationSplitPlaceholder_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationSplitPlaceholder_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should clear placeholder or restore to default (no placeholder)
        expect(obj.$attrs.splitPlaceholder).assertEqual(objCompare.$attrs.splitPlaceholder);
      } catch (error) {
        console.info('[navigationSplitPlaceholder_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationSplitPlaceholder_null_0100] END');
    })

    /**
     * @tc.name   navigationSplitPlaceholder_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_SPLITPLACEHOLDER_UNDEFINED_0100
     * @tc.desc   Test Navigation splitPlaceholder property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationSplitPlaceholder_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationSplitPlaceholder_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_splitPlaceholder_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_splitPlaceholder_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationSplitPlaceholder_undefined_0100] default obj is: "
          + JSON.stringify(objCompare.$attrs));
        console.info("[navigationSplitPlaceholder_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should keep value as is (default: no placeholder)
        expect(obj.$attrs.splitPlaceholder).assertEqual(objCompare.$attrs.splitPlaceholder);
      } catch (error) {
        console.info('[navigationSplitPlaceholder_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationSplitPlaceholder_undefined_0100] END');
    })

    /**
     * @tc.name   navigationEnableVisibilityLifecycleWithContentCover_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_ENABLEVISIBILITYLIFECYCLEWITHCONTENTCOVER_NULL_0100
     * @tc.desc   Test Navigation enableVisibilityLifecycleWithContentCover property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationEnableVisibilityLifecycleWithContentCover_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationEnableVisibilityLifecycleWithContentCover_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_enableVisibilityLifecycleWithContentCover_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_enableVisibilityLifecycleWithContentCover_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationEnableVisibilityLifecycleWithContentCover_null_0100] default obj is: "
          + JSON.stringify(objCompare.$attrs));
        console.info("[navigationEnableVisibilityLifecycleWithContentCover_null_0100] null obj is: "
          + JSON.stringify(obj.$attrs));

        // null should restore to default value (true)
        expect(obj.$attrs.enableVisibilityLifecycleWithContentCover)
          .assertEqual(objCompare.$attrs.enableVisibilityLifecycleWithContentCover);
      } catch (error) {
        console.info('[navigationEnableVisibilityLifecycleWithContentCover_null_0100] ERROR: '
          + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationEnableVisibilityLifecycleWithContentCover_null_0100] END');
    })

    /**
     * @tc.name   navigationEnableVisibilityLifecycleWithContentCover_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_ENABLEVISIBILITYLIFECYCLEWITHCONTENTCOVER_UNDEFINED_0100
     * @tc.desc   Test Navigation enableVisibilityLifecycleWithContentCover property with undefined,
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationEnableVisibilityLifecycleWithContentCover_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationEnableVisibilityLifecycleWithContentCover_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_enableVisibilityLifecycleWithContentCover_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_enableVisibilityLifecycleWithContentCover_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationEnableVisibilityLifecycleWithContentCover_undefined_0100] default obj is: "
          + JSON.stringify(objCompare.$attrs));
        console.info("[navigationEnableVisibilityLifecycleWithContentCover_undefined_0100] undefined obj is: "
          + JSON.stringify(obj.$attrs));

        // undefined should keep value as is (default: true)
        expect(obj.$attrs.enableVisibilityLifecycleWithContentCover)
          .assertEqual(objCompare.$attrs.enableVisibilityLifecycleWithContentCover);
      } catch (error) {
        console.info('[navigationEnableVisibilityLifecycleWithContentCover_undefined_0100] ERROR: '
          + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationEnableVisibilityLifecycleWithContentCover_undefined_0100] END');
    })

    /**
     * @tc.name   navigationBackButtonIcon_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_BACKBUTTONICON_NULL_0100
     * @tc.desc   Test Navigation backButtonIcon property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationBackButtonIcon_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationBackButtonIcon_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_backButtonIcon_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_backButtonIcon_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationBackButtonIcon_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationBackButtonIcon_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.backButtonIcon).assertEqual('');
        console.info('[navigationBackButtonIcon_null_0100] Navigation backButtonIcon with null restores to default');
      } catch (error) {
        console.info('[navigationBackButtonIcon_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationBackButtonIcon_null_0100] END');
    })

    /**
     * @tc.name   navigationBackButtonIcon_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_BACKBUTTONICON_UNDEFINED_0100
     * @tc.desc   Test Navigation backButtonIcon property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationBackButtonIcon_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationBackButtonIcon_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_backButtonIcon_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_backButtonIcon_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationBackButtonIcon_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationBackButtonIcon_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.backButtonIcon).assertEqual('');
      } catch (error) {
        console.info('[navigationBackButtonIcon_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationBackButtonIcon_undefined_0100] END');
    })

    /**
     * @tc.name   navigationBackButtonIcon_empty_0100
     * @tc.number SUB_ARKUI_NAVIGATION_BACKBUTTONICON_EMPTY_0100
     * @tc.desc   Test Navigation backButtonIcon property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationBackButtonIcon_empty_0100', Level.LEVEL0, async () => {
      console.info('[navigationBackButtonIcon_empty_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_backButtonIcon_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_backButtonIcon_empty');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationBackButtonIcon_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationBackButtonIcon_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
        console.info("obj backButtonIcon : " + JSON.stringify(obj.$attrs?.backButtonIcon));
        console.info("empty objCompare backButtonIcon : " + JSON.stringify(objCompare.$attrs?.backButtonIcon));
        // empty string should restore to default value
        expect(obj.$attrs.backButtonIcon).assertEqual('');
      } catch (error) {
        console.info('[navigationBackButtonIcon_empty_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationBackButtonIcon_empty_0100] END');
    })

    /**
     * @tc.name   navigationCustomNavContentTransition_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_CUSTOMNAVCONTENTTRANSITION_NULL_0100
     * @tc.desc   Test Navigation customNavContentTransition property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationCustomNavContentTransition_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationCustomNavContentTransition_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_customNavContentTransition_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_customNavContentTransition_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info("[navigationCustomNavContentTransition_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.customNavContentTransition).assertEqual(objCompare.$attrs.customNavContentTransition);
      } catch (error) {
        console.info('[navigationCustomNavContentTransition_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationCustomNavContentTransition_null_0100] END');
    })

    /**
     * @tc.name   navigationCustomNavContentTransition_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_CUSTOMNAVCONTENTTRANSITION_UNDEFINED_0100
     * @tc.desc   Test Navigation customNavContentTransition property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationCustomNavContentTransition_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationCustomNavContentTransition_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_customNavContentTransition_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_customNavContentTransition_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[CustomNavContentTransition_undefined] default obj is: " + JSON.stringify(objCompare.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.customNavContentTransition).assertEqual(objCompare.$attrs.customNavContentTransition);
      } catch (error) {
        console.info('[navigationCustomNavContentTransition_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationCustomNavContentTransition_undefined_0100] END');
    })

    /**
     * @tc.name   navigationIgnoreLayoutSafeArea_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_IGNORELAYOUTSAFEAREA_NULL_0100
     * @tc.desc   Test Navigation ignoreLayoutSafeArea property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationIgnoreLayoutSafeArea_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationIgnoreLayoutSafeArea_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_ignoreLayoutSafeArea_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_ignoreLayoutSafeArea_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationIgnoreLayoutSafeArea_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationIgnoreLayoutSafeArea_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.ignoreLayoutSafeArea).assertEqual(objCompare.$attrs.ignoreLayoutSafeArea);
      } catch (error) {
        console.info('[navigationIgnoreLayoutSafeArea_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationIgnoreLayoutSafeArea_null_0100] END');
    })

    /**
     * @tc.name   navigationIgnoreLayoutSafeArea_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_IGNORELAYOUTSAFEAREA_UNDEFINED_0100
     * @tc.desc   Test Navigation ignoreLayoutSafeArea property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationIgnoreLayoutSafeArea_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationIgnoreLayoutSafeArea_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_ignoreLayoutSafeArea_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_ignoreLayoutSafeArea_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[IgnoreLayoutSafeArea_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[IgnoreLayoutSafeArea_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.ignoreLayoutSafeArea).assertEqual(objCompare.$attrs.ignoreLayoutSafeArea);
      } catch (error) {
        console.info('[navigationIgnoreLayoutSafeArea_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationIgnoreLayoutSafeArea_undefined_0100] END');
    })

    /**
     * @tc.name   navigationDivider_null_0100
     * @tc.number SUB_ARKUI_NAVIGATION_DIVIDER_NULL_0100
     * @tc.desc   Test Navigation divider property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationDivider_null_0100', Level.LEVEL0, async () => {
      console.info('[navigationDivider_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_divider_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_divider_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationDivider_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationDivider_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
        console.info("[navigationDivider_null_0100] default divider is: " + JSON.stringify(objCompare.$attrs.divider));
        console.info("[navigationDivider_null_0100] null divider is: " + JSON.stringify(obj.$attrs.divider));

        // null should restore to default value
        expect(JSON.stringify(obj.$attrs.divider)).assertEqual(JSON.stringify(objCompare.$attrs.divider));
        console.info('[navigationDivider_null_0100] Navigation divider with null restores to default');
      } catch (error) {
        console.info('[navigationDivider_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationDivider_null_0100] END');
    })

    /**
     * @tc.name   navigationDivider_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATION_DIVIDER_UNDEFINED_0100
     * @tc.desc   Test Navigation divider property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationDivider_undefined_0100', Level.LEVEL0, async () => {
      console.info('[navigationDivider_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('navigation_divider_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('navigation_divider_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigationDivider_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigationDivider_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
        console.info("[navigationDivider_undefined_0100] undefined divider is: " + JSON.stringify(obj.$attrs.divider));

        // undefined should restore to default value
        expect(obj.$attrs.divider?.color).assertEqual(objCompare.$attrs.divider?.color);
        expect(obj.$attrs.divider?.startMargin.includes('0.00')).assertTrue();

        expect(obj.$attrs.divider?.endMargin.includes('0.00')).assertTrue();
        console.info('[navigationDivider_undefined_0100] Navigation divider with undefined restores to default');
      } catch (error) {
        console.info('[navigationDivider_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigationDivider_undefined_0100] END');
    })
  })
}