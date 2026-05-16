/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import router from '@ohos.router';

export class RectValue {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
}

export default class CommonFunc {
  static rect_left: number;
  static rect_top: number;
  static rect_right: number;
  static rect_bottom: number;
  static rect_value: RectValue;

  static sleep(time: number) {
    return new Promise((resolve: (value: string) => void) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static getComponentRect(key: string) {
    let strJson: string = getInspectorByKey(key);
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
    console.info("[getInspectorByKey] rectInfo is: " + JSON.parse('[' + JSON.parse(strJson).$rect + ']'));
    CommonFunc.rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0]
    CommonFunc.rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1]
    CommonFunc.rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0]
    CommonFunc.rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1]
    return CommonFunc.rect_value = {
      left: CommonFunc.rect_left, top: CommonFunc.rect_top, right: CommonFunc.rect_right, bottom: CommonFunc.rect_bottom
    }
  }

  static getComponentRectOnScreen(key: string) :RectValue{
    let strJson = getInspectorByKey(key);
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
    console.info("[getInspectorByKey] rectInfo is: " + JSON.parse('[' + JSON.parse(strJson).$rect + ']'));
    console.info("windowRect Left: " + globalThis.winLeft + ',' + "windowRect Top: " + globalThis.winTop );
    CommonFunc.rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0] + globalThis.winLeft;
    CommonFunc.rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1] + globalThis.winTop;
    CommonFunc.rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0] + globalThis.winLeft;
    CommonFunc.rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1] + globalThis.winTop;
    return CommonFunc.rect_value = {
      left: CommonFunc.rect_left, top: CommonFunc.rect_top, right: CommonFunc.rect_right, bottom: CommonFunc.rect_bottom
    }
  }

  static async openRouterPage(url: string, params?: ESObject): Promise<boolean> {
    try {
      if (params !== undefined) {
        await router.pushUrl({ url: url, params: params });
      } else {
        await router.pushUrl({ url: url });
      }
      return true;
    } catch (_e) {
      return false;
    }
  }

  static async openRouterPageWithParamKey(url: string, key: string, val: string): Promise<boolean> {
    let p: Record<string, Object> = {};
    p[key] = val;
    return CommonFunc.openRouterPage(url, p);
  }

  static popRouterPage(): void {
    try {
      router.back();
    } catch (_e) {
    }
  }

  static async pollAppStorageStatus(statusKey: string, capMs: number, stepMs: number = 200): Promise<string> {
    let u: number = 0;
    while (u <= capMs) {
      let x: string | undefined = AppStorage.get<string>(statusKey);
      if (x === 'ok' || x === 'fail') {
        return x;
      }
      await CommonFunc.sleep(stepMs);
      u += stepMs;
    }
    return AppStorage.get<string>(statusKey) ?? 'pending';
  }
}



