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

export default function NavDestinationAttributeNullUndefinedTest() {
  describe('NavDestinationAttributeNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('NavDestinationAttributeNullUndefined beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navDestination/NavDestinationAttributeNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get NavDestinationAttributeNullUndefined state pages:' + JSON.stringify(pages));
        if (!('NavDestinationAttributeNullUndefined' == pages.name)) {
          console.info('get NavDestinationAttributeNullUndefined pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push NavDestinationAttributeNullUndefined page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push NavDestinationAttributeNullUndefined page error:' + err);
      }
      console.info('NavDestinationAttributeNullUndefined beforeEach end');
      done();
    });

    /**
     * @tc.name   navDestinationTitle_null_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_TITLE_NULL_0100
     * @tc.desc   Test NavDestination title property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationTitle_null_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationTitle_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_title_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_title_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationTitle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationTitle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.title).assertEqual(objCompare.$attrs.title);
        console.info('[navDestinationTitle_null_0100] NavDestination title with null restores to default');
      } catch (error) {
        console.info('[navDestinationTitle_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationTitle_null_0100] END');
    })

    /**
     * @tc.name   navDestinationTitle_undefined_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_TITLE_UNDEFINED_0100
     * @tc.desc   Test NavDestination title property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationTitle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationTitle_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_title_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_title_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationTitle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationTitle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.title).assertEqual(objCompare.$attrs.title);
        console.info('[navDestinationTitle_undefined_0100] NavDestination title with undefined restores to default');
      } catch (error) {
        console.info('[navDestinationTitle_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationTitle_undefined_0100] END');
    })

    /**
     * @tc.name   navDestinationTitle_empty_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_TITLE_EMPTY_0100
     * @tc.desc   Test NavDestination title property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationTitle_empty_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationTitle_empty_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_title_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_title_empty');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationTitle_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationTitle_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));

        // empty string should restore to default value
        expect(obj.$attrs.title).assertEqual(objCompare.$attrs.title);
        console.info('[navDestinationTitle_empty_0100] NavDestination title with empty string restores to default');
      } catch (error) {
        console.info('[navDestinationTitle_empty_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationTitle_empty_0100] END');
    })

    /**
     * @tc.name   navDestinationBackButtonIcon_null_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_BACKBUTTONICON_NULL_0100
     * @tc.desc   Test NavDestination backButtonIcon property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationBackButtonIcon_null_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationBackButtonIcon_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_backButtonIcon_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_backButtonIcon_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationBackButtonIcon_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationBackButtonIcon_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.backButtonIcon).assertEqual(objCompare.$attrs.backButtonIcon);
      } catch (error) {
        console.info('[navDestinationBackButtonIcon_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationBackButtonIcon_null_0100] END');
    })

    /**
     * @tc.name   navDestinationBackButtonIcon_undefined_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_BACKBUTTONICON_UNDEFINED_0100
     * @tc.desc   Test NavDestination backButtonIcon property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationBackButtonIcon_undefined_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationBackButtonIcon_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_backButtonIcon_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_backButtonIcon_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationBackButtonIcon_undefined_0100] default obj " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationBackButtonIcon_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.backButtonIcon).assertEqual(objCompare.$attrs.backButtonIcon);
      } catch (error) {
        console.info('[navDestinationBackButtonIcon_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationBackButtonIcon_undefined_0100] END');
    })

    /**
     * @tc.name   navDestinationBackButtonIcon_empty_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_BACKBUTTONICON_EMPTY_0100
     * @tc.desc   Test NavDestination backButtonIcon property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationBackButtonIcon_empty_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationBackButtonIcon_empty_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_backButtonIcon_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_backButtonIcon_empty');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationBackButtonIcon_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationBackButtonIcon_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));

        // empty string should restore to default value
        expect(obj.$attrs.backButtonIcon).assertEqual(objCompare.$attrs.backButtonIcon);
      } catch (error) {
        console.info('[navDestinationBackButtonIcon_empty_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationBackButtonIcon_empty_0100] END');
    })

    /**
     * @tc.name   navDestinationMenus_null_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_MENUS_NULL_0100
     * @tc.desc   Test NavDestination menus property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationMenus_null_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationMenus_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_menus_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_menus_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationMenus_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationMenus_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.menus).assertEqual(objCompare.$attrs.menus);
        console.info('[navDestinationMenus_null_0100] NavDestination menus with null restores to default');
      } catch (error) {
        console.info('[navDestinationMenus_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationMenus_null_0100] END');
    })

    /**
     * @tc.name   navDestinationMenus_undefined_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_MENUS_UNDEFINED_0100
     * @tc.desc   Test NavDestination menus property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationMenus_undefined_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationMenus_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_menus_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_menus_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationMenus_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationMenus_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.menus).assertEqual(objCompare.$attrs.menus);
        console.info('[navDestinationMenus_undefined_0100] NavDestination menus with undefined restores to default');
      } catch (error) {
        console.info('[navDestinationMenus_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationMenus_undefined_0100] END');
    })

    /**
     * @tc.name   navDestinationToolbarConfiguration_null_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_TOOLBARCONFIGURATION_NULL_0100
     * @tc.desc   Test NavDestination toolbarConfiguration property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationToolbarConfiguration_null_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationToolbarConfiguration_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_toolbarConfiguration_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_toolbarConfiguration_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationToolbarConfiguration_null_0100] default " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationToolbarConfiguration_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.toolbarConfiguration).assertEqual(objCompare.$attrs.toolbarConfiguration);
      } catch (error) {
        console.info('[navDestinationToolbarConfiguration_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationToolbarConfiguration_null_0100] END');
    })

    /**
     * @tc.name   navDestinationToolbarConfiguration_undefined_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_TOOLBARCONFIGURATION_UNDEFINED_0100
     * @tc.desc   Test NavDestination toolbarConfiguration property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationToolbarConfiguration_undefined_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationToolbarConfiguration_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_toolbarConfiguration_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_toolbarConfiguration_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navToolbarConfiguration_undefined_0100]default: " + JSON.stringify(objCompare.$attrs));
        console.info("[navToolbarConfiguration_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.toolbarConfiguration).assertEqual(objCompare.$attrs.toolbarConfiguration);
      } catch (error) {
        console.info('[navDestinationToolbarConfiguration_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationToolbarConfiguration_undefined_0100] END');
    })

    /**
     * @tc.name   navDestinationIgnoreLayoutSafeArea_null_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_IGNORELAYOUTSAFEAREA_NULL_0100
     * @tc.desc   Test NavDestination ignoreLayoutSafeArea property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationIgnoreLayoutSafeArea_null_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationIgnoreLayoutSafeArea_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_ignoreLayoutSafeArea_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_ignoreLayoutSafeArea_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationIgnoreLayoutSafeArea_null_0100] default: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationIgnoreLayoutSafeArea_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.ignoreLayoutSafeArea).assertEqual(objCompare.$attrs.ignoreLayoutSafeArea);
      } catch (error) {
        console.info('[navDestinationIgnoreLayoutSafeArea_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationIgnoreLayoutSafeArea_null_0100] END');
    })

    /**
     * @tc.name   navDestinationIgnoreLayoutSafeArea_undefined_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_IGNORELAYOUTSAFEAREA_UNDEFINED_0100
     * @tc.desc   Test NavDestination ignoreLayoutSafeArea property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationIgnoreLayoutSafeArea_undefined_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationIgnoreLayoutSafeArea_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_ignoreLayoutSafeArea_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_ignoreLayoutSafeArea_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navIgnoreLayoutSafeArea_undefined_0100] default: " + JSON.stringify(objCompare.$attrs));
        console.info("[navIgnoreLayoutSafeArea_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.ignoreLayoutSafeArea).assertEqual(objCompare.$attrs.ignoreLayoutSafeArea);
      } catch (error) {
        console.info('[navDestinationIgnoreLayoutSafeArea_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationIgnoreLayoutSafeArea_undefined_0100] END');
    })

    /**
     * @tc.name   navDestinationIgnoreLayoutSafeArea_empty_0100
     * @tc.number navDestinationIgnoreLayoutSafeArea_empty_0100
     * @tc.desc   Test NavDestination ignoreLayoutSafeArea property with Empty, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationIgnoreLayoutSafeArea_empty_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationIgnoreLayoutSafeArea_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_ignoreLayoutSafeArea_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_ignoreLayoutSafeArea_empty');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationIgnoreLayoutSafeArea_empty_0100] default: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationIgnoreLayoutSafeArea_empty_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
        // undefined should restore to default value
        expect(obj.$attrs.ignoreLayoutSafeArea).assertEqual(objCompare.$attrs.ignoreLayoutSafeArea);
      } catch (error) {
        console.info('[navDestinationIgnoreLayoutSafeArea_empty_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationIgnoreLayoutSafeArea_empty_0100] END');
    })

    /**
     * @tc.name   navDestinationSystemBarStyle_null_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_SYSTEMBARSTYLE_NULL_0100
     * @tc.desc   Test NavDestination systemBarStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationSystemBarStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationSystemBarStyle_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_systemBarStyle_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_systemBarStyle_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationSystemBarStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationSystemBarStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.systemBarStyle).assertEqual(objCompare.$attrs.systemBarStyle);
      } catch (error) {
        console.info('[navDestinationSystemBarStyle_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationSystemBarStyle_null_0100] END');
    })

    /**
     * @tc.name   navDestinationSystemBarStyle_undefined_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_SYSTEMBARSTYLE_UNDEFINED_0100
     * @tc.desc   Test NavDestination systemBarStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationSystemBarStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationSystemBarStyle_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_systemBarStyle_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_systemBarStyle_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationSystemBarStyle_undefined_0100] obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationSystemBarStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.systemBarStyle).assertEqual(objCompare.$attrs.systemBarStyle);
      } catch (error) {
        console.info('[navDestinationSystemBarStyle_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationSystemBarStyle_undefined_0100] END');
    })

    /**
     * @tc.name   navDestinationCustomTransition_null_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_CUSTOMTRANSITION_NULL_0100
     * @tc.desc   Test NavDestination customTransition property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationCustomTransition_null_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationCustomTransition_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_customTransition_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_customTransition_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationCustomTransition_null_0100]  obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationCustomTransition_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.customTransition).assertEqual(objCompare.$attrs.customTransition);
      } catch (error) {
        console.info('[navDestinationCustomTransition_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationCustomTransition_null_0100] END');
    })

    /**
     * @tc.name   navDestinationCustomTransition_undefined_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_CUSTOMTRANSITION_UNDEFINED_0100
     * @tc.desc   Test NavDestination customTransition property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationCustomTransition_undefined_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationCustomTransition_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_customTransition_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_customTransition_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navDestinationCustomTransition_undefined_0100] default: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationCustomTransition_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.customTransition).assertEqual(objCompare.$attrs.customTransition);
      } catch (error) {
        console.info('[navDestinationCustomTransition_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationCustomTransition_undefined_0100] END');
    })

    /**
     * @tc.name   navDestinationPreferredOrientation_null_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_PREFERREDOrientation_NULL_0100
     * @tc.desc   Test NavDestination preferredOrientation property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationPreferredOrientation_null_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationPreferredOrientation_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_preferredOrientation_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_preferredOrientation_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navPreferredOrientation_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationPreferredOrientation_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.preferredOrientation).assertEqual(objCompare.$attrs.preferredOrientation);
      } catch (error) {
        console.info('[navDestinationPreferredOrientation_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationPreferredOrientation_null_0100] END');
    })

    /**
     * @tc.name   navDestinationPreferredOrientation_undefined_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_PREFERREDOrientation_UNDEFINED_0100
     * @tc.desc   Test NavDestination preferredOrientation property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationPreferredOrientation_undefined_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationPreferredOrientation_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_preferredOrientation_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_preferredOrientation_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navPreferredOrientation_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navPreferredOrientation_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.preferredOrientation).assertEqual(objCompare.$attrs.preferredOrientation);
      } catch (error) {
        console.info('[navDestinationPreferredOrientation_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationPreferredOrientation_undefined_0100] END');
    })

    /**
     * @tc.name   navDestinationEnableNavigationIndicator_null_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_ENABLENAVIGATIONINDICATOR_NULL_0100
     * @tc.desc   Test NavDestination enableNavigationIndicator property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationEnableNavigationIndicator_null_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationEnableNavigationIndicator_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_enableNavigationIndicator_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_enableNavigationIndicator_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navEnableNavigationIndicator_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navDestinationEnableNavigationIndicator_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

        // null should restore to default value
        expect(obj.$attrs.enableNavigationIndicator).assertEqual(objCompare.$attrs.enableNavigationIndicator);
      } catch (error) {
        console.info('[navDestinationEnableNavigationIndicator_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationEnableNavigationIndicator_null_0100] END');
    })

    /**
     * @tc.name   navDestinationEnableNavigationIndicator_undefined_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_ENABLENAVIGATIONINDICATOR_UNDEFINED_0100
     * @tc.desc   Test NavDestination enableNavigationIndicator property with undefined, should restore to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navDestinationEnableNavigationIndicator_undefined_0100', Level.LEVEL2, async () => {
      console.info('[navDestinationEnableNavigationIndicator_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('NavDestination_enableNavigationIndicator_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('NavDestination_enableNavigationIndicator_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navEnableNavigationIndicator_undefined_0100] default : " + JSON.stringify(objCompare.$attrs));
        console.info("[navEnableNavigationIndicator_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

        // undefined should restore to default value
        expect(obj.$attrs.enableNavigationIndicator).assertEqual(objCompare.$attrs.enableNavigationIndicator);
      } catch (error) {
        console.info('[navDestinationEnableNavigationIndicator_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navDestinationEnableNavigationIndicator_undefined_0100] END');
    })
  })
}
