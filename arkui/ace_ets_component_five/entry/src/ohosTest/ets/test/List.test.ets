/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import checkboxJsunit from './CheckboxJsunit.test';
import ohosMatrix4Jsunit from './OhosMatrix4Jsunit.test';
import selectJsunit from './SelectJsunit.test';
import fillModeJsunit from './FillModeJsunit.test';
import enumsImageJsunit from './EnmusImageJsunit.test';
import checkboxGroupJsunit from './CheckboxGroupJsunit.test';
import sliderJsunit from './SliderJsunit.test';
import edgeEffectJsunit from './EdgeEffectJsunit.test';
import transFormJsunit from './TransFormJsunit.test';
import visibilityJsunit from './VisibilityJsunit.test';
import positionSettingJsunit from './PositionSettingJsunit.test';
import shapeClippingJsunit from './ShapeClippingJsunit.test';
import backgroundAndSizeSettingJsunit from './BackgroundAndSizeSettingJsunit.test';
import borderJsunit from './BorderJsunit.test';
import colorGradientJsunit from './ColorGradientJsunit.test';
import enmusHorizontalAlignJsunit from './EnmusHorizontalAlignJsunit.test';

export default function testsuite() {
  checkboxJsunit();
  selectJsunit();
  fillModeJsunit();
  enumsImageJsunit();
  ohosMatrix4Jsunit();
  sliderJsunit();
  edgeEffectJsunit();
  checkboxGroupJsunit();
  transFormJsunit();
  borderJsunit();
  colorGradientJsunit();
  visibilityJsunit();
  positionSettingJsunit();
  backgroundAndSizeSettingJsunit();
  shapeClippingJsunit();
  enmusHorizontalAlignJsunit();
}