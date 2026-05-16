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
import NativeCopyStyleTest from './NativeCopyStyleTest.test';
import NativeDrawingFontMgrTest from './NativeDrawingFontMgrTest.test';
import NativeFontTest from './NativeFontTest.test';
import NativeTextLineTest from './NativeTextLineTest.test';
import NativeTextRunTest from './NativeTextRunTest.test';
import NativeTypographyAutoSpaceTest from './NativeTypographyAutoSpaceTest.test';
import NativeTypographyUpdateTest from './NativeTypographyUpdateTest.test';
import NativeUndefinedGlyphDisplayTest from './NativeUndefinedGlyphDisplayTest.test';
import OHDrawingTypographyTest from './OHDrawingTypographyTest.test';

export default function testsuite() {
  NativeCopyStyleTest();
  NativeDrawingFontMgrTest();
  NativeFontTest();
  NativeTextLineTest();
  NativeTextRunTest();
  NativeTypographyAutoSpaceTest();
  NativeTypographyUpdateTest();
  NativeUndefinedGlyphDisplayTest();
  OHDrawingTypographyTest();
}