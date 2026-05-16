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
import { uiObserver } from '@kit.ArkUI'

@Entry
@Component
struct uiObserverScrollEventNullUndefined {
  scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  aboutToAppear(): void {
    console.info('[uiObserverScrollEvent] aboutToAppear START');

    // ========== 测试 uiObserver.on('scrollEvent', callback) - 不带 options ==========
    // 正常注册 scrollEvent 事件监听器
    uiObserver.on('scrollEvent', (info: uiObserver.ScrollEventInfo) => {
      console.info('scrollEventInfo', JSON.stringify(info));

      // 测试1: uiObserver.on(null, callback)
      try {
        uiObserver?.on(null, (info: uiObserver.ScrollEventInfo) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_on_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_on_null', 'error');
      }
      console.info('[uiObserver_scrollEvent] on_null result: ' + AppStorage.get('scrollEvent_on_null'));

      // 测试2: uiObserver.off(null, callback)
      try {
        uiObserver?.off(null, (info: uiObserver.ScrollEventInfo) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_off_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_off_null', 'error');
      }
      console.info('[uiObserver_scrollEvent] off_null result: ' + AppStorage.get('scrollEvent_off_null'));

      // 测试3: uiObserver.on(undefined, callback)
      try {
        uiObserver?.on(undefined, (info: uiObserver.ScrollEventInfo) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_on_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_on_undefined', 'error');
      }
      console.info('[uiObserver_scrollEvent] on_undefined result: ' + AppStorage.get('scrollEvent_on_undefined'));

      // 测试4: uiObserver.off(undefined, callback)
      try {
        uiObserver?.off(undefined, (info: uiObserver.ScrollEventInfo) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_off_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_off_undefined', 'error');
      }
      console.info('[uiObserver_scrollEvent] off_undefined result: ' + AppStorage.get('scrollEvent_off_undefined'));
    });

    // ========== 测试 uiObserver.on('scrollEvent', options, callback) - 带 options ==========
    // 正常注册带 options 的 scrollEvent 事件监听器
    uiObserver.on('scrollEvent', { id: 'uiObserver_scrollEvent_default' }, (info: uiObserver.ScrollEventInfo) => {
      console.info('scrollEventInfo', JSON.stringify(info));

      // 测试5: uiObserver.on(null, options, callback)
      try {
        uiObserver?.on(null, { id: 'uiObserver_scrollEvent_default' }, (info: uiObserver.ScrollEventInfo) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_on_null_id', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_on_null_id', 'error');
      }
      console.info('[uiObserver_scrollEvent] on_null_id result: ' + AppStorage.get('scrollEvent_on_null_id'));

      // 测试6: uiObserver.off(null, options, callback)
      try {
        uiObserver?.off(null, { id: 'uiObserver_scrollEvent_default' }, (info: uiObserver.ScrollEventInfo) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_off_null_id', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_off_null_id', 'error');
      }
      console.info('[uiObserver_scrollEvent] off_null_id result: ' + AppStorage.get('scrollEvent_off_null_id'));

      // 测试7: uiObserver.on(undefined, options, callback)
      try {
        uiObserver?.on(undefined, { id: 'uiObserver_scrollEvent_default' }, (info: uiObserver.ScrollEventInfo) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_on_undefined_id', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_on_undefined_id', 'error');
      }
      console.info('[uiObserver_scrollEvent] on_undefined_id result: ' + AppStorage.get('scrollEvent_on_undefined_id'));

      // 测试8: uiObserver.off(undefined, options, callback)
      try {
        uiObserver?.off(undefined, { id: 'uiObserver_scrollEvent_default' }, (info: uiObserver.ScrollEventInfo) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_off_undefined_id', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_off_undefined_id', 'error');
      }
      console.info('[uiObserver_scrollEvent] off_undefined_id result: ' + AppStorage.get('scrollEvent_off_undefined_id'));

      // 测试9: uiObserver.on('scrollEvent', options, callback)
      try {
        uiObserver?.on('scrollEvent', { id: '' }, (info: uiObserver.ScrollEventInfo) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_on_id_empty', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_on_id_empty', 'error');
      }
      console.info('[uiObserver_scrollEvent] on_id_empty result: ' + AppStorage.get('scrollEvent_on_id_empty'));

      // 测试10: uiObserver.off('scrollEvent', options, callback)
      try {
        uiObserver?.off('scrollEvent', { id: '' }, (info: uiObserver.ScrollEventInfo) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_off_id_empty', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_off_id_empty', 'error');
      }
      console.info('[uiObserver_scrollEvent] off_id_empty result: ' + AppStorage.get('scrollEvent_off_id_empty'));
    });

    console.info('[uiObserverScrollEvent] aboutToAppear END');
  }

  build() {
    Column() {
      // ========== uiObserver scrollEvent tests ==========
      Column() {
        Scroll(this.scroller) {
          Column() {
            ForEach(this.arr, (item: number) => {
              Text(item.toString())
                .width('90%')
                .height('20%')
                .backgroundColor('#330000FF')
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
            }, (item: string) => item)
          }.width('100%')
        }
        .id('uiObserver_scrollEvent_default')
        .height('50%')
        .backgroundColor('#D5D5D5')
      }
      .width('100%')
      .margin({top: 10})
    }
    .height('100%')
  }
}