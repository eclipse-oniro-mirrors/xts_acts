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
import display from '@ohos.display';
import { startAbility, UtilsTest } from '../Util.test.ets';

let want: Want;
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function scrollToTest() {
  describe('ActsScrollToTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility');
    })
    beforeEach(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_scrollTo',
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
     * @tc.number   test_scrollTo
     * @tc.name     test_scrollTo
     * @tc.desc     test_scrollTo
     * @tc.level    Level.LEVEL0
     */
    it('test_scrollTo', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let dragScroll = await driver.findComponent(ON.id('grid_scrollTo_8'));
      const rect = await (dragScroll?.getBounds() as Promise<Rect>);
      let bottom = rect.bottom;
      await CommonFunc.sleep(2000);
      let oriBtn = await driver.findComponent(ON.id('scrollTo'));
      await (oriBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let dragScroll1 = await driver.findComponent(ON.id('grid_scrollTo_8'));
      const rect1 = await (dragScroll1?.getBounds() as Promise<Rect>);
      let bottom1 = rect1.bottom;
      console.info('test_scrollTo bottom' + JSON.stringify(bottom));
      console.info('test_scrollTo bottom1' + JSON.stringify(bottom1));
      expect((Math.round(bottom - bottom1).toInt()) >= 200)
        .assertEqual(true);
      done();
    })
  })
}