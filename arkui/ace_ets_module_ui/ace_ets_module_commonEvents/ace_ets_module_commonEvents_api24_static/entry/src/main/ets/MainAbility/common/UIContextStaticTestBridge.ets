'use static';
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

import { Router, UIContext } from '@ohos.arkui.UIContext';

/** Hypium 与页面树 AppStorage 隔离时，用模块单例把主窗 UIContext 交给静态用例。 */
let mainUIContext: UIContext | undefined = undefined;

export function setMainUIContextForStaticTest(ctx: UIContext): void {
  mainUIContext = ctx;
}

export function getMainUIContextForStaticTest(): UIContext | undefined {
  return mainUIContext;
}

/** 与主窗共用 UIContext.getRouter()；replaceUrl 参数类型与同目录 api24_static 工程一致可用 router.RouterOptions。 */
export function getMainRouterForStaticTest(): Router | undefined {
  return mainUIContext?.getRouter();
}

/** 与同目录 Utils.sleep 一致：静态链路透传对 Promise<void> 的 resolve() 较严，用 string 占位。 */
function delayMs(ms: int): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve('ok');
    }, ms);
  });
}

/**
 * 主窗 getMainWindow → setMainUIContextForStaticTest 晚于 aa start，beforeEach 若立即取 Router 会得到 undefined 并触发 ClassCastError。
 * 轮询直至就绪或超时（与 XTS hilog 中 beforeEach Router 未就绪现象对齐）。
 */
export async function waitForMainRouterForStaticTest(maxWaitMs: int = 12000, stepMs: int = 200):
 Promise<Router | undefined> {
  let waited: int = 0 as int;
  while (waited < maxWaitMs) {
    let r: Router | undefined = getMainRouterForStaticTest();
    if (r !== undefined && r !== null) {
      return r;
    }
    await delayMs(stepMs);
    waited = waited + stepMs;
  }
  return getMainRouterForStaticTest();
}
