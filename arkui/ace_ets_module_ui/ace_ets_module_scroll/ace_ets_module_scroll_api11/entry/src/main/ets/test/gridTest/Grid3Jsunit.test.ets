/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

export default function gridJsunit() {
  describe('grid3Test', () => {
    beforeEach(async (done: Function) => {
      console.info('beforeEach ===================grid test beforeEach called===================');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid/gridPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('beforeEach get prompt state pages:' + JSON.stringify(pages));
        if (!('gridPage' == pages.name)) {
          console.info('beforeEach get prompt state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('beforeEach push prompt page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('beforeEach push prompt page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('[ afterEach ] ===================grid test after each called===================');
    });

    it('gridTest01', Level.LEVEL1, async (done: Function) => {
      console.info('gridTest01==================== start');
      await CommonFunc.sleep(1000)
      let strJson = getInspectorByKey('grid');

      console.info('gridTest01 all attribute before change is: ' + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .columnsGap));
      expect(JSON.parse(strJson).$attrs.columnsGap).assertEqual('2.00px')
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "columnsGap": '3px'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('gridTest01 start to publish emit')
        events_emitter.emit(innerEvent, eventData)
      } catch (err) {
        console.log('gridTest01 change component data error: ' + err.message)
      }
      await CommonFunc.sleep(1000)
      let strJsonAfterChange = getInspectorByKey('grid');
      console.info('gridTest01 columnsGap attribute after change is: ' + JSON.stringify(JSON.parse(strJsonAfterChange)
        .$attrs
        .columnsGap));
      expect(JSON.parse(strJsonAfterChange).$attrs.columnsGap).assertEqual('3.00px')
      console.info('[gridTest01] ==================== end');
      done();
    });

    it('gridTest02', Level.LEVEL1, async (done: Function) => {
      console.info('[ gridTest02 ] ==================== start');
      await CommonFunc.sleep(1000)
      let strJson = getInspectorByKey('grid');

      console.info('[ gridTest02 ] attribute rowsGap before change is: ' + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .rowsGap));
      expect(JSON.parse(strJson).$attrs.rowsGap).assertEqual('2.00px')
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rowsGap": '3px'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 111,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[ gridTest02 ] start to publish emit')
        events_emitter.emit(innerEvent, eventData)
      } catch (err) {
        console.log('[ gridTest02 ] change component data error: ' + err.message)
      }
      await CommonFunc.sleep(1000)
      let strJsonAfterChange = getInspectorByKey('grid');
      console.info('[ gridTest02 ] attribute rowsGap after change is: ' + JSON.stringify(JSON.parse(strJsonAfterChange)
        .$attrs
        .rowsGap));
      expect(JSON.parse(strJsonAfterChange).$attrs.rowsGap).assertEqual('3.00px')
      console.info('[ gridTest02 ] ==================== end');
      done();
    });

    it('gridTest03', Level.LEVEL1, async (done: Function) => {
      console.info('[ gridTest03 ] ==================== start');
      await CommonFunc.sleep(1000)
      let strJson = getInspectorByKey('grid');

      console.info('[ gridTest03 ] attribute columnsTemplate before change is: ' + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .columnsTemplate));
      expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual('1fr 1fr 1fr 1fr 1fr')
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "columnsTemplate": '1fr 1fr 1fr 1fr'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 112,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[ gridTest03 ] start to publish emit')
        events_emitter.emit(innerEvent, eventData)
      } catch (err) {
        console.log('[ gridTest03 ] change component data error: ' + err.message)
      }
      await CommonFunc.sleep(1000)
      let strJsonAfterChange = getInspectorByKey('grid');
      console.info('[ gridTest03 ] attribute columnsTemplate after change is: ' + JSON.stringify(JSON.parse(strJsonAfterChange)
        .$attrs
        .columnsTemplate));
      expect(JSON.parse(strJsonAfterChange).$attrs.columnsTemplate).assertEqual('1fr 1fr 1fr 1fr')
      console.info('[ gridTest03 ] ==================== end');
      done();
    });

    it('gridTest04', Level.LEVEL1, async (done: Function) => {
      console.info('[ gridTest04 ] ==================== start');
      await CommonFunc.sleep(1000)
      let strJson = getInspectorByKey('grid');

      console.info('[ gridTest04 ] attribute rowsTemplate before change is: ' + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .rowsTemplate));
      expect(JSON.parse(strJson).$attrs.rowsTemplate).assertEqual('1fr 1fr 1fr 1fr 1fr')
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rowsTemplate": '1fr 1fr 1fr 1fr'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 113,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[ gridTest04 ] start to publish emit')
        events_emitter.emit(innerEvent, eventData)
      } catch (err) {
        console.log('[ gridTest04 ] change component data error: ' + err.message)
      }
      await CommonFunc.sleep(1000)
      let strJsonAfterChange = getInspectorByKey('grid');
      console.info('[ gridTest04 ] attribute rowsTemplate after change is: ' + JSON.stringify(JSON.parse(strJsonAfterChange)
        .$attrs
        .rowsTemplate));
      expect(JSON.parse(strJsonAfterChange).$attrs.rowsTemplate).assertEqual('1fr 1fr 1fr 1fr')
      console.info('[ gridTest04 ] ==================== end');
      done();
    });
  })
}
