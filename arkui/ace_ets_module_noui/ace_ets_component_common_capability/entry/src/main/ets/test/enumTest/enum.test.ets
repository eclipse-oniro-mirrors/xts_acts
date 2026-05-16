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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect} from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function EnumValueTest() {
  describe('EnumValueTest', () => {
    beforeEach(async (done: Function) => {
      console.info('EnumValueTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/enumTest/enumTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get EnumValueTest state pages:' + JSON.stringify(pages));
        if (!('enumTest' == pages.name)) {
          console.info('get EnumValueTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push EnumValueTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EnumValueTest page error:' + err);
      }
      console.info('EnumValueTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('EnumValueTest after each called');
    });

    /**
     * @tc.name   EnumValueTest_0100
     * @tc.number EnumValueTest_0100
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_0100] SEMI_SILENT is:' + AccessibilitySamePageMode.SEMI_SILENT);
      expect(AccessibilitySamePageMode.SEMI_SILENT).assertEqual(0);
      console.info('[EnumValueTest_0100] FULL_SILENT is:' + AccessibilitySamePageMode.FULL_SILENT);
      expect(AccessibilitySamePageMode.FULL_SILENT).assertEqual(1);
      console.info('[EnumValueTest_0100] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_0200
     * @tc.number EnumValueTest_0200
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_0200] ACTION_SHEET is:' + AccessibilityRoleType.ACTION_SHEET);
      expect(AccessibilityRoleType.ACTION_SHEET).assertEqual(0);

      console.info('[EnumValueTest_0200] ALERT_DIALOG is:' + AccessibilityRoleType.ALERT_DIALOG);
      expect(AccessibilityRoleType.ALERT_DIALOG).assertEqual(1);

      console.info('[EnumValueTest_0200] INDEXER_COMPONENT is:' + AccessibilityRoleType.INDEXER_COMPONENT);
      expect(AccessibilityRoleType.INDEXER_COMPONENT).assertEqual(2);

      console.info('[EnumValueTest_0200] BADGE_COMPONENT is:' + AccessibilityRoleType.BADGE_COMPONENT);
      expect(AccessibilityRoleType.BADGE_COMPONENT).assertEqual(3);

      console.info('[EnumValueTest_0200] BLANK is:' + AccessibilityRoleType.BLANK);
      expect(AccessibilityRoleType.BLANK).assertEqual(4);

      console.info('[EnumValueTest_0200] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_0300
     * @tc.number EnumValueTest_0300
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_0300] BUTTON is:' + AccessibilityRoleType.BUTTON);
      expect(AccessibilityRoleType.BUTTON).assertEqual(5);

      console.info('[EnumValueTest_0300] BACK_BUTTON is:' + AccessibilityRoleType.BACK_BUTTON);
      expect(AccessibilityRoleType.BACK_BUTTON).assertEqual(6);

      console.info('[EnumValueTest_0300] SHEET_DRAG_BAR is:' + AccessibilityRoleType.SHEET_DRAG_BAR);
      expect(AccessibilityRoleType.SHEET_DRAG_BAR).assertEqual(7);

      console.info('[EnumValueTest_0300] CALENDAR_PICKER is:' + AccessibilityRoleType.CALENDAR_PICKER);
      expect(AccessibilityRoleType.CALENDAR_PICKER).assertEqual(8);

      console.info('[EnumValueTest_0300] CALENDAR is:' + AccessibilityRoleType.CALENDAR);
      expect(AccessibilityRoleType.CALENDAR).assertEqual(9);

      console.info('[EnumValueTest_0300] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_0400
     * @tc.number EnumValueTest_0400
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_0400] CANVAS is:' + AccessibilityRoleType.CANVAS);
      expect(AccessibilityRoleType.CANVAS).assertEqual(10);

      console.info('[EnumValueTest_0400] CANVAS_GRADIENT is:' + AccessibilityRoleType.CANVAS_GRADIENT);
      expect(AccessibilityRoleType.CANVAS_GRADIENT).assertEqual(11);

      console.info('[EnumValueTest_0400] CANVAS_PATTERN is:' + AccessibilityRoleType.CANVAS_PATTERN);
      expect(AccessibilityRoleType.CANVAS_PATTERN).assertEqual(12);

      console.info('[EnumValueTest_0400] CHECKBOX is:' + AccessibilityRoleType.CHECKBOX);
      expect(AccessibilityRoleType.CHECKBOX).assertEqual(13);

      console.info('[EnumValueTest_0400] CHECKBOX_GROUP is:' + AccessibilityRoleType.CHECKBOX_GROUP);
      expect(AccessibilityRoleType.CHECKBOX_GROUP).assertEqual(14);

      console.info('[EnumValueTest_0400] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_0500
     * @tc.number EnumValueTest_0500
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_0500', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_0500] CIRCLE is:' + AccessibilityRoleType.CIRCLE);
      expect(AccessibilityRoleType.CIRCLE).assertEqual(15);

      console.info('[EnumValueTest_0500] COLUMN_SPLIT is:' + AccessibilityRoleType.COLUMN_SPLIT);
      expect(AccessibilityRoleType.COLUMN_SPLIT).assertEqual(16);

      console.info('[EnumValueTest_0500] COLUMN is:' + AccessibilityRoleType.COLUMN);
      expect(AccessibilityRoleType.COLUMN).assertEqual(17);

      console.info('[EnumValueTest_0500] CANVAS_RENDERING_CONTEXT_2D is:' + AccessibilityRoleType.CANVAS_RENDERING_CONTEXT_2D);
      expect(AccessibilityRoleType.CANVAS_RENDERING_CONTEXT_2D).assertEqual(18);

      console.info('[EnumValueTest_0500] CHART is:' + AccessibilityRoleType.CHART);
      expect(AccessibilityRoleType.CHART).assertEqual(19);

      console.info('[EnumValueTest_0500] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_0600
     * @tc.number EnumValueTest_0600
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_0600', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_0600] COUNTER is:' + AccessibilityRoleType.COUNTER);
      expect(AccessibilityRoleType.COUNTER).assertEqual(20);

      console.info('[EnumValueTest_0600] CONTAINER_MODAL is:' + AccessibilityRoleType.CONTAINER_MODAL);
      expect(AccessibilityRoleType.CONTAINER_MODAL).assertEqual(21);

      console.info('[EnumValueTest_0600] DATA_PANEL is:' + AccessibilityRoleType.DATA_PANEL);
      expect(AccessibilityRoleType.DATA_PANEL).assertEqual(22);

      console.info('[EnumValueTest_0600] DATE_PICKER is:' + AccessibilityRoleType.DATE_PICKER);
      expect(AccessibilityRoleType.DATE_PICKER).assertEqual(23);

      console.info('[EnumValueTest_0600] DIALOG is:' + AccessibilityRoleType.DIALOG);
      expect(AccessibilityRoleType.DIALOG).assertEqual(24);

      console.info('[EnumValueTest_0600] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_0700
     * @tc.number EnumValueTest_0700
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_0700', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_0700] DIVIDER is:' + AccessibilityRoleType.DIVIDER);
      expect(AccessibilityRoleType.DIVIDER).assertEqual(25);

      console.info('[EnumValueTest_0700] DRAG_BAR is:' + AccessibilityRoleType.DRAG_BAR);
      expect(AccessibilityRoleType.DRAG_BAR).assertEqual(26);

      console.info('[EnumValueTest_0700] EFFECT_COMPONENT is:' + AccessibilityRoleType.EFFECT_COMPONENT);
      expect(AccessibilityRoleType.EFFECT_COMPONENT).assertEqual(27);

      console.info('[EnumValueTest_0700] ELLIPSE is:' + AccessibilityRoleType.ELLIPSE);
      expect(AccessibilityRoleType.ELLIPSE).assertEqual(28);

      console.info('[EnumValueTest_0700] FLEX is:' + AccessibilityRoleType.FLEX);
      expect(AccessibilityRoleType.FLEX).assertEqual(29);

      console.info('[EnumValueTest_0700] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_0800
     * @tc.number EnumValueTest_0800
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_0800', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_0800] FLOW_ITEM is:' + AccessibilityRoleType.FLOW_ITEM);
      expect(AccessibilityRoleType.FLOW_ITEM).assertEqual(30);

      console.info('[EnumValueTest_0800] FORM_COMPONENT is:' + AccessibilityRoleType.FORM_COMPONENT);
      expect(AccessibilityRoleType.FORM_COMPONENT).assertEqual(31);

      console.info('[EnumValueTest_0800] FORM_LINK is:' + AccessibilityRoleType.FORM_LINK);
      expect(AccessibilityRoleType.FORM_LINK).assertEqual(32);

      console.info('[EnumValueTest_0800] GAUGE is:' + AccessibilityRoleType.GAUGE);
      expect(AccessibilityRoleType.GAUGE).assertEqual(33);

      console.info('[EnumValueTest_0800] GRID is:' + AccessibilityRoleType.GRID);
      expect(AccessibilityRoleType.GRID).assertEqual(34);

      console.info('[EnumValueTest_0800] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_0900
     * @tc.number EnumValueTest_0900
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_0900', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_0900] GRID_COL is:' + AccessibilityRoleType.GRID_COL);
      expect(AccessibilityRoleType.GRID_COL).assertEqual(35);

      console.info('[EnumValueTest_0900] GRID_CONTAINER is:' + AccessibilityRoleType.GRID_CONTAINER);
      expect(AccessibilityRoleType.GRID_CONTAINER).assertEqual(36);

      console.info('[EnumValueTest_0900] GRID_ITEM is:' + AccessibilityRoleType.GRID_ITEM);
      expect(AccessibilityRoleType.GRID_ITEM).assertEqual(37);

      console.info('[EnumValueTest_0900] GRID_ROW is:' + AccessibilityRoleType.GRID_ROW);
      expect(AccessibilityRoleType.GRID_ROW).assertEqual(38);

      console.info('[EnumValueTest_0900] HYPERLINK is:' + AccessibilityRoleType.HYPERLINK);
      expect(AccessibilityRoleType.HYPERLINK).assertEqual(39);

      console.info('[EnumValueTest_0900] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_1000
     * @tc.number EnumValueTest_1000
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_1000', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_1000] IMAGE is:' + AccessibilityRoleType.IMAGE);
      expect(AccessibilityRoleType.IMAGE).assertEqual(40);

      console.info('[EnumValueTest_1000] IMAGE_ANIMATOR is:' + AccessibilityRoleType.IMAGE_ANIMATOR);
      expect(AccessibilityRoleType.IMAGE_ANIMATOR).assertEqual(41);

      console.info('[EnumValueTest_1000] IMAGE_BITMAP is:' + AccessibilityRoleType.IMAGE_BITMAP);
      expect(AccessibilityRoleType.IMAGE_BITMAP).assertEqual(42);

      console.info('[EnumValueTest_1000] IMAGE_DATA is:' + AccessibilityRoleType.IMAGE_DATA);
      expect(AccessibilityRoleType.IMAGE_DATA).assertEqual(43);

      console.info('[EnumValueTest_1000] IMAGE_SPAN is:' + AccessibilityRoleType.IMAGE_SPAN);
      expect(AccessibilityRoleType.IMAGE_SPAN).assertEqual(44);

      console.info('[EnumValueTest_1000] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_1100
     * @tc.number EnumValueTest_1100
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_1100', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_1100] LABEL is:' + AccessibilityRoleType.LABEL);
      expect(AccessibilityRoleType.LABEL).assertEqual(45);

      console.info('[EnumValueTest_1100] LINE is:' + AccessibilityRoleType.LINE);
      expect(AccessibilityRoleType.LINE).assertEqual(46);

      console.info('[EnumValueTest_1100] LIST is:' + AccessibilityRoleType.LIST);
      expect(AccessibilityRoleType.LIST).assertEqual(47);

      console.info('[EnumValueTest_1100] LIST_ITEM is:' + AccessibilityRoleType.LIST_ITEM);
      expect(AccessibilityRoleType.LIST_ITEM).assertEqual(48);

      console.info('[EnumValueTest_1100] LIST_ITEM_GROUP is:' + AccessibilityRoleType.LIST_ITEM_GROUP);
      expect(AccessibilityRoleType.LIST_ITEM_GROUP).assertEqual(49);

      console.info('[EnumValueTest_1100] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_1200
     * @tc.number EnumValueTest_1200
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_1200', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_1200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_1200] LOADING_PROGRESS is:' + AccessibilityRoleType.LOADING_PROGRESS);
      expect(AccessibilityRoleType.LOADING_PROGRESS).assertEqual(50);

      console.info('[EnumValueTest_1200] MARQUEE is:' + AccessibilityRoleType.MARQUEE);
      expect(AccessibilityRoleType.MARQUEE).assertEqual(51);

      console.info('[EnumValueTest_1200] MATRIX2D is:' + AccessibilityRoleType.MATRIX2D);
      expect(AccessibilityRoleType.MATRIX2D).assertEqual(52);

      console.info('[EnumValueTest_1200] MENU is:' + AccessibilityRoleType.MENU);
      expect(AccessibilityRoleType.MENU).assertEqual(53);

      console.info('[EnumValueTest_1200] MENU_ITEM is:' + AccessibilityRoleType.MENU_ITEM);
      expect(AccessibilityRoleType.MENU_ITEM).assertEqual(54);

      console.info('[EnumValueTest_1200] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_1300
     * @tc.number EnumValueTest_1300
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_1300', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_1300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_1300] MENU_ITEM_GROUP is:' + AccessibilityRoleType.MENU_ITEM_GROUP);
      expect(AccessibilityRoleType.MENU_ITEM_GROUP).assertEqual(55);

      console.info('[EnumValueTest_1300] NAV_DESTINATION is:' + AccessibilityRoleType.NAV_DESTINATION);
      expect(AccessibilityRoleType.NAV_DESTINATION).assertEqual(56);

      console.info('[EnumValueTest_1300] NAV_ROUTER is:' + AccessibilityRoleType.NAV_ROUTER);
      expect(AccessibilityRoleType.NAV_ROUTER).assertEqual(57);

      console.info('[EnumValueTest_1300] NAVIGATION is:' + AccessibilityRoleType.NAVIGATION);
      expect(AccessibilityRoleType.NAVIGATION).assertEqual(58);

      console.info('[EnumValueTest_1300] NAVIGATION_BAR is:' + AccessibilityRoleType.NAVIGATION_BAR);
      expect(AccessibilityRoleType.NAVIGATION_BAR).assertEqual(59);

      console.info('[EnumValueTest_1300] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_1400
     * @tc.number EnumValueTest_1400
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_1400', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_1400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_1400] NAVIGATION_MENU is:' + AccessibilityRoleType.NAVIGATION_MENU);
      expect(AccessibilityRoleType.NAVIGATION_MENU).assertEqual(60);

      console.info('[EnumValueTest_1400] NAVIGATOR is:' + AccessibilityRoleType.NAVIGATOR);
      expect(AccessibilityRoleType.NAVIGATOR).assertEqual(61);

      console.info('[EnumValueTest_1400] OFFSCREEN_CANVAS is:' + AccessibilityRoleType.OFFSCREEN_CANVAS);
      expect(AccessibilityRoleType.OFFSCREEN_CANVAS).assertEqual(62);

      console.info('[EnumValueTest_1400] OFFSCREEN_CANVAS_RENDERING_CONTEXT2D is:' + AccessibilityRoleType.OFFSCREEN_CANVAS_RENDERING_CONTEXT2D);
      expect(AccessibilityRoleType.OFFSCREEN_CANVAS_RENDERING_CONTEXT2D).assertEqual(63);

      console.info('[EnumValueTest_1400] OPTION is:' + AccessibilityRoleType.OPTION);
      expect(AccessibilityRoleType.OPTION).assertEqual(64);

      console.info('[EnumValueTest_1400] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_1500
     * @tc.number EnumValueTest_1500
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_1500', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_1500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_1500] PANEL is:' + AccessibilityRoleType.PANEL);
      expect(AccessibilityRoleType.PANEL).assertEqual(65);

      console.info('[EnumValueTest_1500] PAPER_PAGE is:' + AccessibilityRoleType.PAPER_PAGE);
      expect(AccessibilityRoleType.PAPER_PAGE).assertEqual(66);

      console.info('[EnumValueTest_1500] PATH is:' + AccessibilityRoleType.PATH);
      expect(AccessibilityRoleType.PATH).assertEqual(67);

      console.info('[EnumValueTest_1500] PATH2D is:' + AccessibilityRoleType.PATH2D);
      expect(AccessibilityRoleType.PATH2D).assertEqual(68);

      console.info('[EnumValueTest_1500] PATTERN_LOCK is:' + AccessibilityRoleType.PATTERN_LOCK);
      expect(AccessibilityRoleType.PATTERN_LOCK).assertEqual(69);

      console.info('[EnumValueTest_1500] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_1600
     * @tc.number EnumValueTest_1600
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_1600', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_1600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_1600] PICKER is:' + AccessibilityRoleType.PICKER);
      expect(AccessibilityRoleType.PICKER).assertEqual(70);

      console.info('[EnumValueTest_1600] PICKER_VIEW is:' + AccessibilityRoleType.PICKER_VIEW);
      expect(AccessibilityRoleType.PICKER_VIEW).assertEqual(71);

      console.info('[EnumValueTest_1600] PLUGIN_COMPONENT is:' + AccessibilityRoleType.PLUGIN_COMPONENT);
      expect(AccessibilityRoleType.PLUGIN_COMPONENT).assertEqual(72);

      console.info('[EnumValueTest_1600] POLYGON is:' + AccessibilityRoleType.POLYGON);
      expect(AccessibilityRoleType.POLYGON).assertEqual(73);

      console.info('[EnumValueTest_1600] POLYLINE is:' + AccessibilityRoleType.POLYLINE);
      expect(AccessibilityRoleType.POLYLINE).assertEqual(74);

      console.info('[EnumValueTest_1600] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_1700
     * @tc.number EnumValueTest_1700
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_1700', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_1700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_1700] POPUP is:' + AccessibilityRoleType.POPUP);
      expect(AccessibilityRoleType.POPUP).assertEqual(75);

      console.info('[EnumValueTest_1700] PROGRESS is:' + AccessibilityRoleType.PROGRESS);
      expect(AccessibilityRoleType.PROGRESS).assertEqual(76);

      console.info('[EnumValueTest_1700] QRCODE is:' + AccessibilityRoleType.QRCODE);
      expect(AccessibilityRoleType.QRCODE).assertEqual(77);

      console.info('[EnumValueTest_1700] RADIO is:' + AccessibilityRoleType.RADIO);
      expect(AccessibilityRoleType.RADIO).assertEqual(78);

      console.info('[EnumValueTest_1700] RATING is:' + AccessibilityRoleType.RATING);
      expect(AccessibilityRoleType.RATING).assertEqual(79);

      console.info('[EnumValueTest_1700] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_1800
     * @tc.number EnumValueTest_1800
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_1800', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_1800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_1800] RECT is:' + AccessibilityRoleType.RECT);
      expect(AccessibilityRoleType.RECT).assertEqual(80);

      console.info('[EnumValueTest_1800] REFRESH is:' + AccessibilityRoleType.REFRESH);
      expect(AccessibilityRoleType.REFRESH).assertEqual(81);

      console.info('[EnumValueTest_1800] RELATIVE_CONTAINER is:' + AccessibilityRoleType.RELATIVE_CONTAINER);
      expect(AccessibilityRoleType.RELATIVE_CONTAINER).assertEqual(82);

      console.info('[EnumValueTest_1800] REMOTE_WINDOW is:' + AccessibilityRoleType.REMOTE_WINDOW);
      expect(AccessibilityRoleType.REMOTE_WINDOW).assertEqual(83);

      console.info('[EnumValueTest_1800] RICH_EDITOR is:' + AccessibilityRoleType.RICH_EDITOR);
      expect(AccessibilityRoleType.RICH_EDITOR).assertEqual(84);

      console.info('[EnumValueTest_1800] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_1900
     * @tc.number EnumValueTest_1900
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_1900', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_1900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_1900] RICH_TEXT is:' + AccessibilityRoleType.RICH_TEXT);
      expect(AccessibilityRoleType.RICH_TEXT).assertEqual(85);

      console.info('[EnumValueTest_1900] ROLE_PAGER is:' + AccessibilityRoleType.ROLE_PAGER);
      expect(AccessibilityRoleType.ROLE_PAGER).assertEqual(86);

      console.info('[EnumValueTest_1900] ROW is:' + AccessibilityRoleType.ROW);
      expect(AccessibilityRoleType.ROW).assertEqual(87);

      console.info('[EnumValueTest_1900] ROW_SPLIT is:' + AccessibilityRoleType.ROW_SPLIT);
      expect(AccessibilityRoleType.ROW_SPLIT).assertEqual(88);

      console.info('[EnumValueTest_1900] SCROLL is:' + AccessibilityRoleType.SCROLL);
      expect(AccessibilityRoleType.SCROLL).assertEqual(89);

      console.info('[EnumValueTest_1900] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_2000
     * @tc.number EnumValueTest_2000
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_2000', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_2000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_2000] SCROLL_BAR is:' + AccessibilityRoleType.SCROLL_BAR);
      expect(AccessibilityRoleType.SCROLL_BAR).assertEqual(90);

      console.info('[EnumValueTest_2000] SEARCH is:' + AccessibilityRoleType.SEARCH);
      expect(AccessibilityRoleType.SEARCH).assertEqual(91);

      console.info('[EnumValueTest_2000] SEARCH_FIELD is:' + AccessibilityRoleType.SEARCH_FIELD);
      expect(AccessibilityRoleType.SEARCH_FIELD).assertEqual(92);

      console.info('[EnumValueTest_2000] SELECT is:' + AccessibilityRoleType.SELECT);
      expect(AccessibilityRoleType.SELECT).assertEqual(93);

      console.info('[EnumValueTest_2000] SHAPE is:' + AccessibilityRoleType.SHAPE);
      expect(AccessibilityRoleType.SHAPE).assertEqual(94);

      console.info('[EnumValueTest_2000] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_2100
     * @tc.number EnumValueTest_2100
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_2100', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_2100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_2100] SIDEBAR_CONTAINER is:' + AccessibilityRoleType.SIDEBAR_CONTAINER);
      expect(AccessibilityRoleType.SIDEBAR_CONTAINER).assertEqual(95);

      console.info('[EnumValueTest_2100] SLIDER is:' + AccessibilityRoleType.SLIDER);
      expect(AccessibilityRoleType.SLIDER).assertEqual(96);

      console.info('[EnumValueTest_2100] SPAN is:' + AccessibilityRoleType.SPAN);
      expect(AccessibilityRoleType.SPAN).assertEqual(97);

      console.info('[EnumValueTest_2100] STACK is:' + AccessibilityRoleType.STACK);
      expect(AccessibilityRoleType.STACK).assertEqual(98);

      console.info('[EnumValueTest_2100] STEPPER is:' + AccessibilityRoleType.STEPPER);
      expect(AccessibilityRoleType.STEPPER).assertEqual(99);

      console.info('[EnumValueTest_2100] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_2200
     * @tc.number EnumValueTest_2200
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_2200', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_2200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_2200] STEPPER_ITEM is:' + AccessibilityRoleType.STEPPER_ITEM);
      expect(AccessibilityRoleType.STEPPER_ITEM).assertEqual(100);

      console.info('[EnumValueTest_2200] SWIPER is:' + AccessibilityRoleType.SWIPER);
      expect(AccessibilityRoleType.SWIPER).assertEqual(101);

      console.info('[EnumValueTest_2200] SWIPER_INDICATOR is:' + AccessibilityRoleType.SWIPER_INDICATOR);
      expect(AccessibilityRoleType.SWIPER_INDICATOR).assertEqual(102);

      console.info('[EnumValueTest_2200] SWITCH is:' + AccessibilityRoleType.SWITCH);
      expect(AccessibilityRoleType.SWITCH).assertEqual(103);

      console.info('[EnumValueTest_2200] SYMBOL_GLYPH is:' + AccessibilityRoleType.SYMBOL_GLYPH);
      expect(AccessibilityRoleType.SYMBOL_GLYPH).assertEqual(104);

      console.info('[EnumValueTest_2200] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_2300
     * @tc.number EnumValueTest_2300
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_2300', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_2300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_2300] TAB_CONTENT is:' + AccessibilityRoleType.TAB_CONTENT);
      expect(AccessibilityRoleType.TAB_CONTENT).assertEqual(105);

      console.info('[EnumValueTest_2300] TAB_BAR is:' + AccessibilityRoleType.TAB_BAR);
      expect(AccessibilityRoleType.TAB_BAR).assertEqual(106);

      console.info('[EnumValueTest_2300] TABS is:' + AccessibilityRoleType.TABS);
      expect(AccessibilityRoleType.TABS).assertEqual(107);

      console.info('[EnumValueTest_2300] TEXT is:' + AccessibilityRoleType.TEXT);
      expect(AccessibilityRoleType.TEXT).assertEqual(108);

      console.info('[EnumValueTest_2300] TEXT_CLOCK is:' + AccessibilityRoleType.TEXT_CLOCK);
      expect(AccessibilityRoleType.TEXT_CLOCK).assertEqual(109);

      console.info('[EnumValueTest_2300] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_2400
     * @tc.number EnumValueTest_2400
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_2400', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_2400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_2400] TEXT_ENTRY is:' + AccessibilityRoleType.TEXT_ENTRY);
      expect(AccessibilityRoleType.TEXT_ENTRY).assertEqual(110);

      console.info('[EnumValueTest_2400] TEXT_INPUT is:' + AccessibilityRoleType.TEXT_INPUT);
      expect(AccessibilityRoleType.TEXT_INPUT).assertEqual(111);

      console.info('[EnumValueTest_2400] TEXT_PICKER is:' + AccessibilityRoleType.TEXT_PICKER);
      expect(AccessibilityRoleType.TEXT_PICKER).assertEqual(112);

      console.info('[EnumValueTest_2400] TEXT_TIMER is:' + AccessibilityRoleType.TEXT_TIMER);
      expect(AccessibilityRoleType.TEXT_TIMER).assertEqual(113);

      console.info('[EnumValueTest_2400] TEXT_AREA is:' + AccessibilityRoleType.TEXT_AREA);
      expect(AccessibilityRoleType.TEXT_AREA).assertEqual(114);

      console.info('[EnumValueTest_2400] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_2500
     * @tc.number EnumValueTest_2500
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_2500', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_2500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_2500] TEXT_FIELD is:' + AccessibilityRoleType.TEXT_FIELD);
      expect(AccessibilityRoleType.TEXT_FIELD).assertEqual(115);

      console.info('[EnumValueTest_2500] TIME_PICKER is:' + AccessibilityRoleType.TIME_PICKER);
      expect(AccessibilityRoleType.TIME_PICKER).assertEqual(116);

      console.info('[EnumValueTest_2500] TITLE_BAR is:' + AccessibilityRoleType.TITLE_BAR);
      expect(AccessibilityRoleType.TITLE_BAR).assertEqual(117);

      console.info('[EnumValueTest_2500] UI_EXTENSION_COMPONENT is:' + AccessibilityRoleType.UI_EXTENSION_COMPONENT);
      expect(AccessibilityRoleType.UI_EXTENSION_COMPONENT).assertEqual(119);

      console.info('[EnumValueTest_2500] VIDEO is:' + AccessibilityRoleType.VIDEO);
      expect(AccessibilityRoleType.VIDEO).assertEqual(120);

      console.info('[EnumValueTest_2500] END');
      done();
    });

    /**
     * @tc.name   EnumValueTest_2600
     * @tc.number EnumValueTest_2600
     * @tc.desc   Enum Value Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnumValueTest_2600', Level.LEVEL2, async (done: Function) => {
      console.info('EnumValueTest_2600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[EnumValueTest_2600] WATER_FLOW is:' + AccessibilityRoleType.WATER_FLOW);
      expect(AccessibilityRoleType.WATER_FLOW).assertEqual(121);

      console.info('[EnumValueTest_2600] WEB is:' + AccessibilityRoleType.WEB);
      expect(AccessibilityRoleType.WEB).assertEqual(122);

      console.info('[EnumValueTest_2600] XCOMPONENT is:' + AccessibilityRoleType.XCOMPONENT);
      expect(AccessibilityRoleType.XCOMPONENT).assertEqual(123);

      console.info('[EnumValueTest_2600] ROLE_NONE is:' + AccessibilityRoleType.ROLE_NONE);
      expect(AccessibilityRoleType.ROLE_NONE).assertEqual(124);

      console.info('[EnumValueTest_2600] UNDEFINED_ACTION is:' + AccessibilityAction.UNDEFINED_ACTION);
      expect(AccessibilityAction.UNDEFINED_ACTION).assertEqual(0);

      console.info('[EnumValueTest_2600] END');
      done();
    });

  })
}