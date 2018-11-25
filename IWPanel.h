/* IWPanel */

#import <Cocoa/Cocoa.h>
#import "IWNovaController.h"

@interface IWPanel : NSPanel
{
    IBOutlet IWNovaController * novaController;
}
@end
