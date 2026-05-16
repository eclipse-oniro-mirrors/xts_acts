/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import graphicImagePixelMap from './GraphicImagePixelMap.test';
import graphicImagePixelMap2 from './GraphicImagePixelMap2.test';
import graphicImagePixelMap3 from './GraphicImagePixelMap3.test';
import graphicImagePixelMap4 from './GraphicImagePixelMap4.test';
import graphicImagePixelMap5 from './GraphicImagePixelMap5.test';
import graphicImagePixelMapAPI2601 from './GraphicImagePixelMapAPI2601.test';
import graphicImagePixelMapAPI2602 from './GraphicImagePixelMapAPI2602.test';
import graphicImagePixelMapAPI2603 from './GraphicImagePixelMapAPI2603.test';
import GraphicImagePixelMapErrorCode from './GraphicImagePixelMapErrorCode.test';
export default function testsuite() {
  graphicImagePixelMap();
  graphicImagePixelMap2();
  graphicImagePixelMap3();
  graphicImagePixelMap4();
  graphicImagePixelMap5();
  graphicImagePixelMapAPI2601();
  graphicImagePixelMapAPI2602();
  graphicImagePixelMapAPI2603();
  GraphicImagePixelMapErrorCode();
}