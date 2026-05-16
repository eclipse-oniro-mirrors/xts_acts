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

// Tabs
import TabsAnimationDurationTest from './Tabs/tabsAnimationDuration.test'
import TabsAnimationModeTest from './Tabs/tabsAnimationMode.test'
import TabsBarBackgroundBlurStyleTest from './Tabs/tabsBarBackgroundBlurStyle.test'
import TabsBarBackgroundColorTest from './Tabs/tabsBarBackgroundColor.test'
import TabsBarBackgroundEffectTest from './Tabs/tabsBarBackgroundEffect.test'
import TabsBarGridAlignTest from './Tabs/tabsBarGridAlign.test'
import TabsBarModeTest from './Tabs/tabsBarMode.test'
import TabsBarOverlapTest from './Tabs/tabsBarOverlap.test'
import TabsBarPositionTest from './Tabs/tabsBarPosition.test'
import TabsCustomContentTransitionTest from './Tabs/tabsCustomContentTransition.test'
import TabsFadingEdgeTest from './Tabs/tabsFadingEdge.test'
import TabsOnAnimationEndTest from './Tabs/tabsOnAnimationEnd.test'
import TabsOnAnimationStartTest from './Tabs/tabsOnAnimationStart.test'
import TabsOnChangeTest from './Tabs/tabsOnChange.test'
import TabsOnContentWillChangeTest from './Tabs/tabsOnContentWillChange.test'
import TabsOnGestureSwipeTest from './Tabs/tabsOnGestureSwipe.test'
import TabsOnSelectedTest from './Tabs/tabsOnSelected.test'
import TabsOnTabBarClickTest from './Tabs/tabsOnTabBarClick.test'
import TabsOnUnselectedTest from './Tabs/tabsOnUnselected.test'
import TabsScrollableTest from './Tabs/tabsScrollable.test'
import TabsVerticalTest from './Tabs/tabsVertical.test'

// TabsModifier
import TabsAnimationDurationModifierTest from './TabsModifier/tabsAnimationDurationModifier.test'
import TabsAnimationModeModifierTest from './TabsModifier/tabsAnimationModeModifier.test'
import TabsBarBackgroundBlurStyleModifierTest from './TabsModifier/tabsBarBackgroundBlurStyleModifier.test'
import TabsBarBackgroundColorModifierTest from './TabsModifier/tabsBarBackgroundColorModifier.test'
import TabsBarBackgroundEffectModifierTest from './TabsModifier/tabsBarBackgroundEffectModifier.test'
import TabsBarGridAlignModifierTest from './TabsModifier/tabsBarGridAlignModifier.test'
import TabsBarModeModifierTest from './TabsModifier/tabsBarModeModifier.test'
import TabsBarOverlapModifierTest from './TabsModifier/tabsBarOverlapModifier.test'
import TabsBarPositionModifierTest from './TabsModifier/tabsBarPositionModifier.test'
import TabsCustomContentTransitionModifierTest from './TabsModifier/tabsCustomContentTransitionModifier.test'
import TabsFadingEdgeModifierTest from './TabsModifier/tabsFadingEdgeModifier.test'
import TabsOnAnimationEndModifierTest from './TabsModifier/tabsOnAnimationEndModifier.test'
import TabsOnAnimationStartModifierTest from './TabsModifier/tabsOnAnimationStartModifier.test'
import TabsOnChangeModifierTest from './TabsModifier/tabsOnChangeModifier.test'
import TabsOnContentWillChangeModifierTest from './TabsModifier/tabsOnContentWillChangeModifier.test'
import TabsOnGestureSwipeModifierTest from './TabsModifier/tabsOnGestureSwipeModifier.test'
import TabsOnSelectedModifierTest from './TabsModifier/tabsOnSelectedModifier.test'
import TabsOnTabBarClickModifierTest from './TabsModifier/tabsOnTabBarClickModifier.test'
import TabsOnUnselectedModifierTest from './TabsModifier/tabsOnUnselectedModifier.test'
import TabsScrollableModifierTest from './TabsModifier/tabsScrollableModifier.test'
import TabsVerticalModifierTest from './TabsModifier/tabsVerticalModifier.test'

// TabContent
import TabContentOnWillHideTest from './TabContent/tabContentOnWillHide.test'
import TabContentOnWillShowTest from './TabContent/tabContentOnWillShow.test'
import TabContentTabBarTest from './TabContent/tabContentTabBar.test'

// TabContentModifier
import TabContentOnWillHideModifierTest from './TabContentModifier/tabContentOnWillHideModifier.test'
import TabContentOnWillShowModifierTest from './TabContentModifier/tabContentOnWillShowModifier.test'
import TabContentTabBarModifierTest from './TabContentModifier/tabContentTabBarModifier.test'

export default function testsuite() {
  // Tabs
  TabsAnimationDurationTest();
  TabsAnimationModeTest();
  TabsBarBackgroundBlurStyleTest();
  TabsBarBackgroundColorTest();
  TabsBarBackgroundEffectTest();
  TabsBarGridAlignTest();
  TabsBarModeTest();
  TabsBarOverlapTest();
  TabsBarPositionTest();
  TabsCustomContentTransitionTest();
  TabsFadingEdgeTest();
  TabsOnAnimationEndTest();
  TabsOnAnimationStartTest();
  TabsOnChangeTest();
  TabsOnContentWillChangeTest();
  TabsOnGestureSwipeTest();
  TabsOnSelectedTest();
  TabsOnTabBarClickTest();
  TabsOnUnselectedTest();
  TabsScrollableTest();
  TabsVerticalTest();

  // TabsModifier
  TabsAnimationDurationModifierTest();
  TabsAnimationModeModifierTest();
  TabsBarBackgroundBlurStyleModifierTest();
  TabsBarBackgroundColorModifierTest();
  TabsBarBackgroundEffectModifierTest();
  TabsBarGridAlignModifierTest();
  TabsBarModeModifierTest();
  TabsBarOverlapModifierTest();
  TabsBarPositionModifierTest();
  TabsCustomContentTransitionModifierTest();
  TabsFadingEdgeModifierTest();
  TabsOnAnimationEndModifierTest();
  TabsOnAnimationStartModifierTest();
  TabsOnChangeModifierTest();
  TabsOnContentWillChangeModifierTest();
  TabsOnGestureSwipeModifierTest();
  TabsOnSelectedModifierTest();
  TabsOnTabBarClickModifierTest();
  TabsOnUnselectedModifierTest();
  TabsScrollableModifierTest();
  TabsVerticalModifierTest();

  // TabContent
  TabContentOnWillHideTest();
  TabContentOnWillShowTest();
  TabContentTabBarTest();

  // TabContentModifier
  TabContentOnWillHideModifierTest();
  TabContentOnWillShowModifierTest();
  TabContentTabBarModifierTest();
}