//
//  VideoComponentView.swift
//  RenderTodoDemo
//
 

import UIKit
import Render

// the model is marked as component state.
extension Video: ComponentStateType { }

class VideoComponentView: StaticComponentView {
    

    /// The component state.
    var video: Video? {
        return self.state as? Video
    }
    
    /// Constructs the component tree.
    override func construct() -> ComponentNodeType {
        
        return ComponentNode<UIView>().configure({ view in
            view.style.flexDirection = .Column
            view.backgroundColor = S.Color.black
            view.style.dimensions.width =  ~self.referenceSize.width
            
        }).children([
            
            ComponentNode<UIImageView>().configure({ view in
                view.image = self.video?.cover
                view.style.alignItems = .Center
                view.style.dimensions.width = ~self.referenceSize.width
                view.style.dimensions.height = (~self.referenceSize.width * 9)/16

            }).children([
                
                ComponentNode<UIView>().configure({ view in
                    view.style.flex = Flex.Max
                    view.style.alignSelf = .Stretch
                    view.style.justifyContent = .Center
                    view.style.flexDirection = .Row
                    
                }).children([
                    DefaultButton().configure({ view in
                        view.setTitle("FOO", forState: .Normal)
                    }),
                    DefaultButton().configure({ view in
                        view.setTitle("BAR", forState: .Normal)
                    }),
                    DefaultButton().configure({ view in
                        view.setTitle("BAZ", forState: .Normal)
                    })
                ])
            ])
            
        ])
    }
}


