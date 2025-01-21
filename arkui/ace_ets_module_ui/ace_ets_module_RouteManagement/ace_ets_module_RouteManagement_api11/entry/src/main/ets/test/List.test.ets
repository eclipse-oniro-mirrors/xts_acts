/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import pushPageInit from './supplementRouterTest/pushPageInit.test'
import router_back1 from './router10/router_back1.test'
import router_push1 from './router10/router_push1.test'
import Router1 from './Router/Router1.test'
import Router2 from './Router/Router2.test'
import Router3 from './Router/Router3.test'
import Router4 from './Router/Router4.test'
import stageRouterTest from './Router/stageRouter.test'

import aboutToAppearRouterTest from './back_router/init_page.test';
import aboutToAppearRouterTest2 from './back_router/init_page2.test';
import goWithParams from './back_router/A_page.test'
import RouterPushUrlJsunit from './State/RouterPushUrlJsunit.test';
import RouterWithParamJsunit from './State/RouterWithParamJsunit.test';
import RouterUrlErrorJsunit from './State/RouterUrlErrorJsunit.test';
import routerReplaceJsunit from './Router/routerReplaceJsunit.test';

import systemRouterJsunit from './Router/SystemRouterJsunit.test';
import routerStandardJsunit from './ohosRouterTest/router.test';
import ohosRouterJsunit from './Router/OhosRouterJsnuit.test';

export default function testsuite() {
  pushPageInit();
  router_back1();
  router_push1();
  Router1();
  Router2();
  Router3();
  Router4();
  aboutToAppearRouterTest();
  aboutToAppearRouterTest2();
  goWithParams();
  RouterPushUrlJsunit();
  RouterWithParamJsunit();
  RouterUrlErrorJsunit();
  stageRouterTest();
  routerReplaceJsunit();
  systemRouterJsunit()
  routerStandardJsunit()
  ohosRouterJsunit();
}