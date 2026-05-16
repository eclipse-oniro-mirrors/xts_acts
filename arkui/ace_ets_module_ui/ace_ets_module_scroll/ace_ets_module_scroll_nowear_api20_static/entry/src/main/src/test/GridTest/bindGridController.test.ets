'use static'

import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, ON, MouseButton, MatchPattern, UiDirection, Rect } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

import CommonFunc from '../common/Common';
import Utils from '../common/Utils';
import { startAbility, UtilsTest } from '../Util.test.ets';

let want: Want;
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function bindGridControllerSetOnTest() {
  describe('ActsBindGridControllerSetOnTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility');
    })
    beforeEach(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/bindGridController',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextLineSpacingTest state pages: ' + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          console.info('get TextLineSpacingTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('push TextLineSpacingTest page error: ' + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   test_bindGridController
     * @tc.name     test_bindGridController
     * @tc.desc     test_bindGridController
     * @tc.level    Level.LEVEL0
     */
    it('test_bindGridController', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let oriBtn = await driver.findComponent(ON.id('bindGridController'));
      await (oriBtn?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let oriBtn1 = await driver.findComponent(ON.id('set'));
      await (oriBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let oriBtn2 = await driver.findComponent(ON.id('scrollBy'));
      await (oriBtn2?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      await (oriBtn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('str6'))
        .getElement('$attrs')
        .getString('content'))
        .assertEqual('OnWillScroll start');
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('str'))
        .getElement('$attrs')
        .getString('content'))
        .assertEqual('OnDidScroll start');
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('str4'))
        .getElement('$attrs')
        .getString('content'))
        .assertEqual('onScrollIndex start');
      done();
    })

    /**
     * @tc.number   test_bindGridController_01
     * @tc.name     test_bindGridController_01
     * @tc.desc     test_bindGridController_01
     * @tc.level    Level.LEVEL0
     */
    it('test_bindGridController_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let oriBtn = await driver.findComponent(ON.id('bindGridController'));
      await (oriBtn?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let oriBtn1 = await driver.findComponent(ON.id('set'));
      await (oriBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let dragScroll = await driver.findComponent(ON.id('grid_dragging_fling'));
      const rect = await (dragScroll?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let right = rect.right;
      let left = rect.left;
      let bottom = rect.bottom;
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width * 0.9).toInt(),        // 起点 X：左侧 10% 处（避免贴边）
        Math.round(top + height / 2).toInt(),          // 起点 Y：垂直中线
        Math.round(left + width * 0.5).toInt(),        // 终点 X：右侧 90% 处（避免贴边）
        Math.round(top + height / 2).toInt() );
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('str3'))
        .getElement('$attrs')
        .getString('content'))
        .assertEqual('OnScrollFrameBegin start');
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('str2'))
        .getElement('$attrs')
        .getString('content'))
        .assertEqual('OnScrollStart start');
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('str5'))
        .getElement('$attrs')
        .getString('content'))
        .assertEqual('OnScrollStop start');
      await driver.swipe(Math.round(left + width * 0.1).toInt(),        // 起点 X：左侧 10% 处（避免贴边）
        Math.round(top + height / 2).toInt(),          // 起点 Y：垂直中线
        Math.round(left + width * 0.9).toInt(),        // 终点 X：右侧 90% 处（避免贴边）
        Math.round(top + height / 2).toInt() );
      await CommonFunc.sleep(200);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('str7'))
        .getElement('$attrs')
        .getString('content'))
        .assertEqual('OnReachStart start');
      done();
    })
  })
}