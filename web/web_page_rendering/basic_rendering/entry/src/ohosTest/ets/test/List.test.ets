/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import webJsunit from './WebJsunit.test';
import MetaViewport from './MetaViewport.test';
import webOnFirstMeaningfulPaint from './WebOnFirstMeaningfulPaint.test';
import webOnLargestContentfulPaint from './WebOnLargestContentfulPaint.test';
import webOnFirstCont from './webOnFirstCont.test';
import webOnFirstContFour from './webOnFirstContFour.test';
import webOnFirstContThree from './webOnFirstContThree.test';
import webOnFirstContTwo from './webOnFirstContTwo.test';
import webOnFullScreenEnter from './webOnFullScreenEnter.test';
import webOnFullScreenExit from './webOnFullScreenExit.test';
import webviewTerminateRenderProcess from './webviewTerminateRenderProcess.test';
import wholeWebPageDrawing from './wholeWebPageDrawing.test';
import webViewOnFullScreenEnter from './webViewOnFullScreenEnter.test';
import webViewOnFullScreenExit from './webViewOnFullScreenExit.test';
import getSurfaceId from './getSurfaceId.test';
import webViewControllerJsunit from './webViewControllerJsunit.test';


export default function testsuite() {
  webJsunit();
  MetaViewport();
  webOnFirstMeaningfulPaint();
  webOnLargestContentfulPaint();
  webOnFirstCont();
  webOnFirstContFour();
  webOnFirstContThree();
  webOnFirstContTwo();
  //webOnFullScreenEnter();
  //webOnFullScreenExit();
  webviewTerminateRenderProcess();
  wholeWebPageDrawing();
  //webViewOnFullScreenEnter();
  //webViewOnFullScreenExit();
  getSurfaceId();
  webViewControllerJsunit();
}