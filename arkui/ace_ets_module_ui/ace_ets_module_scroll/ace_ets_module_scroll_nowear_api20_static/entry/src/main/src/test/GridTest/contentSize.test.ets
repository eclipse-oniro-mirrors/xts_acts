'use static'

import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, ON, MouseButton, MatchPattern, UiDirection } from '@kit.TestKit';
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
const HEIGHT = 600;
const WIDTH = 200;

export default function contentSizeTest() {
  describe('ActsContentSizeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility');
    })
    beforeEach(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_contentSize',
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
     * @tc.number   test_ContentSize
     * @tc.name     test_ContentSize
     * @tc.desc     test_ContentSize
     * @tc.level    Level.LEVEL0
     */
    it('test_ContentSize', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('normal'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      expect(parseInt(JSON.parseJsonElement(inspector.getInspectorByKey('contentWidth'))
        .getElement('$attrs')
        .getString('content')) > 0)
        .assertTrue();
      expect(parseInt(JSON.parseJsonElement(inspector.getInspectorByKey('contentHeight'))
        .getElement('$attrs')
        .getString('content')) > 0)
        .assertTrue();
      done();
    })
  })
}