'use static';
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
import AttachDetachTest from './CanvasRenderingContext2D/AttachDetachTest.test';
import AttachDetachRebindTest from './CanvasRenderingContext2D/AttachDetachRebindTest.test';
import CanvasAttrsTest from './CanvasRenderingContext2D/CanvasAttrsTest.test';
import CanvasAttrsTabTest from './CanvasRenderingContext2D/CanvasAttrsTabTest.test';
export default function testsuite() {
  AttachDetachTest();
  AttachDetachRebindTest();
  CanvasAttrsTest();
  CanvasAttrsTabTest();
}