VRAnimationTools
================

UIView category for common animations using CPAnimationSequence.

Installation
------------

- Subtree CPAnimationSequence repository somewhere in your project.
```
git subtree add --prefix=Requirements/CPAnimationSequence --squash https://github.com/yangmeyer/CPAnimationSequence.git master
```

- Subtree this repository somewhere in your project.
```
git subtree add --prefix=Requirements/VRAnimationTools --squash https://github.com/IvanRublev/VRAnimationTools.git master
```

- Drag & drop `VRAnimationTools` folder in to your poject.
- Add `-ObjC` to Other Linker Flags in project's Build Settings. And add `"./Requirements/**"` to Header Search Paths.
- Add VRUIKitTools target to Target Dependencies in Build phases of your project's target.
- Link to libVRUIKitTools.a in General tab of your project's target.
- Add `#import "VRAnimationTools.h"` to YourProject-Prefix.pch. 

Now it's ready to use!
