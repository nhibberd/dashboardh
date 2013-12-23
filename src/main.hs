import qualified Dashboardh
import Web.Scotty
import Network.Wai.Middleware.RequestLogger

main :: IO ()
main = 
  scotty 3000 $ do
  middleware logStdoutDev
  Dashboardh.dash