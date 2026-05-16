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

export default function bindListControllerSetOnTest() {
  describe('ActsBindListControllerSetOnTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility');
    })
    beforeEach(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/list/bindListController',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextLineSpacingTest state pages: ' + JSON.stringify(pages));
        if (!('bindListController' == pages.name)) {
          console.info('get TextLineSpacingTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('push TextLineSpacingTest page error: ' + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   test_bindListController
     * @tc.name     test_bindListController
     * @tc.desc     test_bindListController
     * @tc.level    Level.LEVEL0
     */
    it('test_bindListController', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let oriBtn = await driver.findComponent(ON.id('bindListController'));
      await (oriBtn?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let oriBtn1 = await driver.findComponent(ON.id('setOn'));
      await (oriBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let oriBtn2 = await driver.findComponent(ON.id('scrollBy'));
      await (oriBtn2?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let oriBtn3 = await driver.findComponent(ON.id('scrollBy0'));
      await (oriBtn3?.click() as Promise<void>);
      await CommonFunc.sleep(200);
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
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('str1'))
        .getElement('$attrs')
        .getString('content'))
        .assertEqual('OnReachEnd start');
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('str7'))
        .getElement('$attrs')
        .getString('content'))
        .assertEqual('OnReachStart start');
      done();
    })
  })
}