function hf-sandbox-creds --description 'Print HF-Sandbox temp AWS creds as bash export lines (paste into the EC2 box)'
    aws configure export-credentials --profile HF-Sandbox-access-754289655784 --format env $argv
end
