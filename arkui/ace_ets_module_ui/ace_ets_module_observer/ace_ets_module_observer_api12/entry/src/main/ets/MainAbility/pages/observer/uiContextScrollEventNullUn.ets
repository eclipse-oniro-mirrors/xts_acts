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
import { UIObserver } from '@kit.ArkUI';

@Entry
@Component
struct uiContextScrollEventNullUndefined {
  scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  observer: UIObserver = this.getUIContext().getUIObserver();

  aboutToAppear(): void {
    console.info('[getUIObserverScrollEvent] aboutToAppear START');

    // ========== 测试 UIObserver.on('scrollEvent', callback) - 不带 options ==========
    // 正常注册 scrollEvent 事件监听器
    this.observer.on('scrollEvent', (info) => {
      console.info('scrollEventInfo', JSON.stringify(info));

      // 测试1: UIObserver.on(null, callback)
      try {
        this.observer?.on(null, () => {
          console.info('scrollEventInfo', 'scrollEvent on null');
        });
        AppStorage.setOrCreate('scrollEvent_UIObserver_on_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_UIObserver_on_null', 'error');
      }
      console.info('[getUIObserver_scrollEvent]on_null result: ' + AppStorage.get('scrollEvent_UIObserver_on_null'));

      // 测试2: UIObserver.off(null, callback)
      try {
        this.observer?.off(null, () => {
          console.info('scrollEventInfo', 'scrollEvent off null');
        });
        AppStorage.setOrCreate('scrollEvent_UIObserver_off_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_UIObserver_off_null', 'error');
      }
      console.info('[getUIObserver_scrollEvent]off_null result: ' + AppStorage.get('scrollEvent_UIObserver_off_null'));

      // 测试3: UIObserver.on(undefined, callback)
      try {
        this.observer?.on(undefined, () => {
          console.info('scrollEventInfo', 'scrollEvent on undefined');
        });
        AppStorage.setOrCreate('scrollEvent_UIObserver_on_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_UIObserver_on_undefined', 'error');
      }
      console.info('[getUIObserver_scrollEvent]on_undefined result: ' + AppStorage.get('scrollEvent_UIObserver_on_undefined'));

      // 测试4: UIObserver.off(undefined, callback)
      try {
        this.observer?.off(undefined, () => {
          console.info('scrollEventInfo', 'scrollEvent off undefined');
        });
        AppStorage.setOrCreate('scrollEvent_UIObserver_off_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_UIObserver_off_undefined', 'error');
      }
      console.info('[getUIObserver_scrollEvent]off_undefined result: ' + AppStorage.get('scrollEvent_UIObserver_off_undefined'));
    });

    // ========== 测试 UIObserver.on('scrollEvent', options, callback) - 带 options ==========
    // 正常注册带 options 的 scrollEvent 事件监听器
    this.observer.on('scrollEvent', { id: 'getUIObserver_scrollEvent_default' }, (info) => {
      console.info('scrollEventInfo', JSON.stringify(info));

      // 测试5: UIObserver.on(null, options, callback)
      try {
        this.observer?.on(null, { id: 'getUIObserver_scrollEvent_default' }, () => {
          console.info('scrollEventInfo', 'scrollEvent id on null');
        });
        AppStorage.setOrCreate('scrollEvent_UIObserver_on_null_id', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_UIObserver_on_null_id', 'error');
      }
      console.info('[getUIObserver_scrollEvent]on_null_id result: ' + AppStorage.get('scrollEvent_UIObserver_on_null_id'));

      // 测试6: UIObserver.off(null, options, callback)
      try {
        this.observer?.off(null, { id: 'getUIObserver_scrollEvent_default' }, () => {
          console.info('scrollEventInfo', 'scrollEvent id on null');
        });
        AppStorage.setOrCreate('scrollEvent_UIObserver_off_null_id', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_UIObserver_off_null_id', 'error');
      }
      console.info('[getUIObserver_scrollEvent]off_null_id result: ' + AppStorage.get('scrollEvent_UIObserver_off_null_id'));

      // 测试7: UIObserver.on(undefined, options, callback)
      try {
        this.observer?.on(undefined, { id: 'getUIObserver_scrollEvent_default' }, () => {
          console.info('scrollEventInfo', 'scrollEvent id on null');
        });
        AppStorage.setOrCreate('scrollEvent_UIObserver_on_undefined_id', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_UIObserver_on_undefined_id', 'error');
      }
      console.info('[getUIObserver_scrollEvent]on_undefined_id result: ' + AppStorage.get('scrollEvent_UIObserver_on_undefined_id'));

      // 测试8: UIObserver.off(undefined, options, callback)
      try {
        this.observer?.off(undefined, { id: 'getUIObserver_scrollEvent_default' }, () => {
          console.info('scrollEventInfo', 'scrollEvent id on null');
        });
        AppStorage.setOrCreate('scrollEvent_UIObserver_off_undefined_id', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_UIObserver_off_undefined_id', 'error');
      }
      console.info('[getUIObserver_scrollEvent]off_undefined_id result: ' + AppStorage.get('scrollEvent_UIObserver_off_undefined_id'));

      // 测试9: UIObserver.on('scrollEvent', options, callback)
      try {
        this.observer?.on('scrollEvent', { id: '' }, (info) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_UIObserver_on_id_empty', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_UIObserver_on_id_empty', 'error');
      }
      console.info('[getUIObserver_scrollEvent]on_id_empty result: ' + AppStorage.get('scrollEvent_UIObserver_on_id_empty'));

      // 测试10: UIObserver.off('scrollEvent', options, callback)
      try {
        this.observer?.off('scrollEvent', { id: '' }, (info) => {
          console.info('scrollEventInfo', JSON.stringify(info));
        });
        AppStorage.setOrCreate('scrollEvent_UIObserver_off_id_empty', 'success');
      } catch (e) {
        AppStorage.setOrCreate('scrollEvent_UIObserver_off_id_empty', 'error');
      }
      console.info('[getUIObserver_scrollEvent]off_id_empty result: ' + AppStorage.get('scrollEvent_UIObserver_off_id_empty'));
    });

    console.info('[getUIObserverScrollEvent] aboutToAppear END');
  }

  build() {
    Column() {
      // ========== UIObserver scrollEvent tests ==========
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
        .id('getUIObserver_scrollEvent_default')
        .height('50%')
        .backgroundColor('#D5D5D5')
      }
      .width('100%')
      .margin({top: 10})
    }
    .height('100%')
  }
}