/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import drawingTsPathTest from "./Path.test";
import drawingTsPath2Test from "./Path2.test";
import drawingTsPath3Test from "./Path3.test";
import drawingTsPath4Test from "./Path4.test";
import drawingTsPath6Test from "./Path6.test";

export default function testsuite() {
  drawingTsPathTest();
  drawingTsPath2Test();
  drawingTsPath3Test();
  drawingTsPath4Test();
  drawingTsPath6Test();
}